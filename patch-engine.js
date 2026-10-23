/* MIT. Local compatibility integration by Nevarielle with OpenAI Codex. */
(function (root) {
  'use strict';
  async function sha256(bytes) {
    if (!root.crypto || !root.crypto.subtle) throw new Error('WebCrypto is unavailable. Open the HTML file in a current Chrome, Edge or Firefox browser.');
    const digest = await root.crypto.subtle.digest('SHA-256', bytes);
    return Array.from(new Uint8Array(digest), n => n.toString(16).padStart(2, '0')).join('');
  }
  async function build(mod, input, specifications, hook) {
    const spec = specifications[mod];
    if (!spec) throw new Error('Unknown mod.');
    if (input.byteLength > 32 * 1024 * 1024) throw new Error('The archive is too large for the supported original mod.');
    const original = await root.JSZip.loadAsync(input);
    const entries = Object.values(original.files).filter(entry => !entry.dir);
    if (entries.length > 100) throw new Error('Too many files for the supported original mod.');
    const files = {};
    for (const [path, expectedHash] of Object.entries(spec.files)) {
      const lower = path.toLowerCase();
      const matching = entries.filter(entry => {
        const name = entry.name.replace(/\\/g, '/').toLowerCase();
        return name === lower || name.endsWith('/' + lower);
      });
      if (matching.length !== 1) throw new Error('Expected exactly one original file: ' + path);
      const bytes = await matching[0].async('uint8array');
      if (bytes.byteLength > 16 * 1024 * 1024) throw new Error('Unexpected file size: ' + path);
      if (await sha256(bytes) !== expectedHash) throw new Error('Not the supported original ' + spec.version + ' file: ' + path + '. Download the original ZIP from its author.');
      files[path] = bytes;
    }
    let text = new TextDecoder('utf-8', {fatal: true}).decode(files[spec.target]).replace(/\r\n/g, '\n');
    if (mod === 'QuickhackHotkeys') {
      const startMarker = '@replaceMethod(QuickhacksListGameController)\nprivate final func SetVisibility';
      const endMarker = '@wrapMethod(QuickhacksListGameController)\nprotected cb func OnAction';
      const start = text.indexOf(startMarker);
      const end = text.indexOf(endMarker, start + 1);
      if (start < 0 || end <= start) throw new Error('Expected menu hook was not found.');
      text = text.slice(0, start) + hook.replace(/\r\n/g, '\n') + text.slice(end);
      const header = 'protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {\n';
      const guard = '  if !this.m_active || !IsDefined(this.m_playerObject) || !IsDefined(this.GetPlayerControlledObject()) {\n    return false;\n  };\n';
      text = text.replace(header, header + guard);
    } else {
      text = text.replace('this.m_filtersRadioGroup.SetData(this.m_filterManager.GetIntFiltersList());',
        'let personalFilterList = this.m_filterManager.GetIntFiltersList();\n        this.m_filtersRadioGroup.SetData(personalFilterList);');
    }
    files[spec.target] = new TextEncoder().encode(text.replace(/\n/g, '\r\n'));
    if (await sha256(files[spec.target]) !== spec.patched_sha256) throw new Error('Patched script did not match the tested version.');
    const output = new root.JSZip();
    for (const [path, bytes] of Object.entries(files)) output.file(path, bytes);
    return output.generateAsync({type: 'uint8array', compression: 'DEFLATE'});
  }
  root.CompatibilityPatch = {build, sha256};
})(globalThis);
