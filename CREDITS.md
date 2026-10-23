# Credits and license scope

This is an **unofficial compatibility build collection**, published by [Nevarielle](https://github.com/Nevarielle).

| Component | Original author / project | 2.50 compatibility contribution used |
| --- | --- | --- |
| RED4ext | Octavian Dima / WopsS and contributors | alphanin9, merged by WopsS; [PR 154](https://github.com/WopsS/RED4ext/pull/154) |
| redscript | jac3km4 and contributors | bjorno43, building on Antrakt92 and the work of alphanin9; [PR 206](https://github.com/jac3km4/redscript/pull/206) |
| ArchiveXL | Pavel Siberx / psiberx and contributors | Alexey-shishkin4; [PR 31](https://github.com/psiberx/cp2077-archive-xl/pull/31) |
| Codeware | Pavel Siberx / psiberx and contributors | KelpHect; [PR 63](https://github.com/psiberx/cp2077-codeware/pull/63) |
| TweakXL | Pavel Siberx / psiberx and contributors | KelpHect; [PR 22](https://github.com/psiberx/cp2077-tweak-xl/pull/22) |
| Input Loader | Jack Humbert and contributors | Upstream main source, rebuilt with the 2.50 SDK revision used by the Mod Settings port |
| Mod Settings | Jack Humbert and contributors | Alexey-shishkin4; [PR 33](https://github.com/jackhumbert/mod_settings/pull/33) |
| Quickhack Hotkeys (original not included) | DJ_Kovrik / djkovrik | Local compatibility transformer provided here |
| Equipment-EX (original not included) | psiberx and DJ_Kovrik, plus translators credited by the original project | Local one-expression compatibility transformer provided here |

The underlying RED4ext.SDK work is by WopsS, Yamashi/maximegmd, the authors of the SDK revisions referenced in the upstream ports, and other SDK contributors. The dependency notices in `licenses/` and the component ZIPs retain their original attribution.

## Work done for this collection

Prepared with **OpenAI Codex** at Nevarielle's request: diagnosis of the local 2.50 startup failures; discovery and integration of the community ports above; native compilation and the mimalloc 2.2.4 build pin; an Input Loader SDK update; the Quickhack menu-lifecycle wrapper and inactive-player guard; the Equipment-EX temporary-array fix; packaging, checksums, installation instructions and verification. Nevarielle performed the gameplay check and confirmed that the quickhack hotkeys work.

Codex did **not** author the original mods or the upstream 2.50 ports. Most native compatibility changes in these downloads are the work of the contributors linked above.

`LICENSE` at repository root covers only this collection's new scripts and documentation. Original mods and linked upstream changes retain their own licenses. Quickhack Hotkeys and Equipment-EX original archives are not redistributed. Download them from their authors; the local transformer reads that ZIP and creates a replacement ZIP on your own computer. The original ZIP and installed game are left untouched.

These are independent, experimental builds. The original authors have not endorsed this collection.

The offline browser patcher uses [JSZip 3.10.1](https://github.com/Stuk/jszip/tree/v3.10.1) by Stuart Knightley, David Duponchel, Franz Buchinger, Antonio Afonso and contributors, under its MIT option. The original notice is in `licenses/JSZip-LICENSE.md`.
