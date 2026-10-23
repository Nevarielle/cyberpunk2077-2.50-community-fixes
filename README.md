# Cyberpunk 2077 2.50 — individual mod compatibility catalog

[Русский каталог](README.ru.md) · [Downloads](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/tag/v0.2.0-cp250) · [Authors and work](CREDITS.md) · [Exact sources](PROVENANCE.json)

Separate downloads and compatibility notes for the mods and frameworks updated or integrated during a Windows **Cyberpunk 2077 2.50 / 3.0.88.46235** repair. This catalog covers **all 11 components individually**, including **Cyber Engine Tweaks 1.38.0**. Published by **Nevarielle**, prepared with **OpenAI Codex**, with original and port authors credited separately.

**Choose the component you need and read its page.** The catalog is not a mandatory mod pack. Dependency lists, change descriptions, testing and limits are listed per component. Most community ports are experimental; CET is an unchanged mirror of its official release.

| Component | Version | Download / status | Details |
| --- | --- | --- | --- |
| **Cyber Engine Tweaks (CET)** | 1.38.0 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/00_Cyber_Engine_Tweaks_1.38.0_CP250_Official.zip) — Official release mirror | [Details](mods/cet.md) |
| **RED4ext** | 1.30.0 + 47ac01c | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/01_RED4ext_1.30.0_CP250_Unofficial.zip) — Upstream CI build | [Details](mods/red4ext.md) |
| **redscript** | 0.5.x + PR 206 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/02_redscript_PR206_CP250_Unofficial.zip) — Pull-request CI build | [Details](mods/redscript.md) |
| **ArchiveXL** | 1.27.5 + PR 31 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/03_ArchiveXL_1.27.5_CP250_Unofficial.zip) — Locally built community port | [Details](mods/archivexl.md) |
| **Input Loader** | 0.2.3 + main + 2.50 SDK | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/04_Input_Loader_0.2.3_CP250_Unofficial.zip) — Locally rebuilt upstream source | [Details](mods/input-loader.md) |
| **Mod Settings** | 0.2.21 + PR 33 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/05_Mod_Settings_0.2.21_CP250_Unofficial.zip) — Locally built community port | [Details](mods/mod-settings.md) |
| **Codeware** | 1.20.6 + PR 63 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/06_Codeware_1.20.6_CP250_Unofficial.zip) — Locally built community port | [Details](mods/codeware.md) |
| **TweakXL** | 1.11.5 + PR 22 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/07_TweakXL_1.11.5_CP250_Unofficial.zip) — Locally built community port | [Details](mods/tweakxl.md) |
| **Quickhack Hotkeys** | 2.3.2 + local compatibility patch | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/08_Quickhack_Hotkeys_2.3.2_CP250_Local_Patcher.zip) — Separate local patcher | [Details](mods/quickhack-hotkeys.md) |
| **Equipment-EX** | 1.2.9 + local compatibility patch | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/09_Equipment_EX_1.2.9_CP250_Local_Patcher.zip) — Separate local patcher | [Details](mods/equipment-ex.md) |
| **AutoLoot** | 3.11.2 personal customization | Not distributed / Не распространяется — Personal work documented; not distributed | [Details](mods/autoloot.md) |

## How to use the downloads

- Component ZIPs **00–07**: close the game, replace the corresponding older mod in Vortex, keep one active version and deploy. Install dependencies listed on that component's page. Keep previous archives and save backups.
- Separate local patchers **08–09**: obtain the exact original mod ZIP from its author, extract the patcher, open **Patch-Mods.html**, create/save a replacement ZIP locally, then install that generated ZIP in Vortex. Source mods are not rehosted. The browser tool sends no files to a server.
- **AutoLoot**: the personal 3.11.2 customization is documented only; the authors require permission for public modifications. Its private archive, code, configuration and patcher are not included.

CET 1.38.0 is required by CET Lua mods; it is not required by Quickhack Hotkeys. Conversely, updating CET does not update each Lua mod automatically. See each component's dependencies. Prefer newer compatible official updates as they become available.

## Verification and attribution

CET startup/Lua/TweakDB/RTTI smoke tests succeeded; the five native plugins loaded and redscript compiled on the tested game build. Quickhack hotkeys were confirmed by the user. Other features have narrower validation, detailed on each component page. The AutoLoot customization passed 24 behavior checks and syntax checks for 10 Lua files, without live gameplay validation by the assistant.

Original mod development and the community 2.50 ports belong to the authors in [CREDITS.md](CREDITS.md). This project's contribution is diagnosis, verified retrieval, integration, local compilation/build fixes, the separately described personal script changes, packaging and verification. It does not claim authorship of CET or the original ports.

No game binaries, saves, local backups or personal settings are published. The official CET package is unmodified; other native ZIPs preserve original code/license notices and include this catalog's attribution. Exact artifact hashes are in `SHA256SUMS.txt`.
