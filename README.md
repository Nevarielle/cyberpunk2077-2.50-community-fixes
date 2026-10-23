# Cyberpunk 2077 2.50 — unofficial community compatibility builds

[Русская инструкция](README.ru.md) · [Download the test release](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/tag/v0.1.0-cp250) · [Credits](CREDITS.md) · [Sources and exact revisions](PROVENANCE.json)

A tested set of Windows x64 compatibility builds for **Cyberpunk 2077 2.50 (3.0.88.46235)**, plus local patch tools for Quickhack Hotkeys 2.3.2 and Equipment-EX 1.2.9. Published by **Nevarielle**, prepared with **OpenAI Codex**, using the original authors' mods and the community ports credited in [CREDITS.md](CREDITS.md).

**Experimental prerelease.** Upstream base version numbers are retained; a `CP250_Unofficial` suffix identifies these downloads. They are not official new releases. Prefer a newer, compatible official release when available. Do not install this collection on 2.31 or a different game build.

## Install with Vortex

1. Close the game. Keep copies of your previous mod archives and saves.
2. Download individual ZIPs from the [releases page](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases). For Quickhack Hotkeys, use **01 RED4ext**, **02 redscript**, **03 ArchiveXL**, **04 Input Loader** and the original mod; **05 Mod Settings** enables in-game rebinding. Install each ZIP in Vortex as a replacement for its older version, then deploy. Keep only one active copy of each component.
3. **06 Codeware** and **07 TweakXL** are included for players using Equipment-EX or other mods that require them. They are not extra requirements of Quickhack Hotkeys itself.
4. Download the original [Quickhack Hotkeys 2.3.2](https://www.nexusmods.com/cyberpunk2077/mods/7238) from its author. The files are not mirrored here.
5. Extract `Local_Compatibility_Tools_CP250.zip` and double-click **Patch-Mods.html**. Select the mod and the original ZIP, click **Build ZIP**, then **Save ZIP**. This works offline in a current Chrome, Edge or Firefox browser; nothing is uploaded.

The optional command-line alternative requires **PowerShell 7**. With your own paths:

```powershell
.\Build-Mod-Compatibility.ps1 -Mod QuickhackHotkeys -OriginalArchive 'C:\Downloads\Quickhack Hotkeys.zip' -OutputArchive 'C:\Downloads\QuickhackHotkeys_CP250.zip'
```

6. Install the generated ZIP in Vortex **instead of** the original Quickhack Hotkeys archive, then deploy. The transformer requires the exact tested original files, checks their SHA-256, and refuses changed or unsupported input. It never edits the installed game or the original ZIP.
7. If you use [Equipment-EX 1.2.9](https://www.nexusmods.com/cyberpunk2077/mods/6945), download the original and generate its replacement ZIP as well:

```powershell
.\Build-Mod-Compatibility.ps1 -Mod EquipmentEX -OriginalArchive 'C:\Downloads\Equipment-EX.zip' -OutputArchive 'C:\Downloads\EquipmentEX_CP250.zip'
```

Install that ZIP as the Equipment-EX replacement, with ArchiveXL, Codeware, TweakXL, RED4ext and redscript active. **CET is not required by Quickhack Hotkeys.** Update CET separately if your other mods use it.

## What was changed

- RED4ext and redscript: the CI builds identified in `PROVENANCE.json`.
- ArchiveXL, Codeware, TweakXL and Mod Settings: locally compiled community 2.50 ports linked in `CREDITS.md`.
- Input Loader: upstream main, rebuilt with the specified 2.50 SDK.
- Quickhack Hotkeys: add the eight input listeners around the game's own menu lifecycle rather than replacing that lifecycle; ignore input on an inactive controller or missing player.
- Equipment-EX: keep the filter array in a local variable before passing it to `SetData`, fixing a compilation failure.

The native ports are other contributors' work. The integration, build fixes and two local script transformations were prepared with Codex. The original mods remain credited to their authors.

## Tested and known limits

Tested on one Windows installation of the specified game build. All five native plugins loaded, redscript compilation completed, Input Loader merged the quickhack actions, and TweakXL applied Equipment-EX tweaks. The publisher confirmed the quickhack keyboard hotkeys work. This is not full testing of every mod or every controller input.

ArchiveXL's journal extension and resource hot reload are not ported in the selected upstream patch and remain disabled. Corresponding log messages are expected; Quickhack Hotkeys does not require these features. The Mod Settings menu was not exhaustively tested.

No game files, saves, local backups or personal settings are included. Original Quickhack Hotkeys and Equipment-EX archives are not redistributed. Component ZIPs carry the original license notices plus the source and credit information for this collection. SHA-256 checksums are supplied with the release.
