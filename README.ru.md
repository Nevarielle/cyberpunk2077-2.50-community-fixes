# Cyberpunk 2077 2.50 — отдельные обновления модов

[English catalog](README.md) · [Скачать](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/tag/v0.2.0-cp250) · [Авторы и вклад](CREDITS.md) · [Точные исходники](PROVENANCE.json)

Каталог **всех 11 компонентов по отдельности**, которые обновлялись, собирались или настраивались при ремонте Cyberpunk 2077 **2.50 / 3.0.88.46235** на Windows. В том числе **CET 1.38.0**. Издатель — **Nevarielle**, подготовка с помощью **OpenAI Codex**. Авторство оригинальных модов, портов 2.50 и нашей работы указано раздельно.

**Выберите нужный мод и откройте его страницу.** Установка всего каталога не требуется. Для каждого компонента указаны изменения, зависимости, способ установки, степень проверки и ограничения. Большинство портов сообщества экспериментальные; CET — неизменённая копия официального релиза.

| Мод | Версия | Загрузка / статус | Подробности |
| --- | --- | --- | --- |
| **Cyber Engine Tweaks (CET)** | 1.38.0 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/00_Cyber_Engine_Tweaks_1.38.0_CP250_Official.zip) — Официальный релиз, копия без изменений | [Страница](mods/cet.md) |
| **RED4ext** | 1.30.0 + 47ac01c | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/01_RED4ext_1.30.0_CP250_Unofficial.zip) — Сборка CI разработчиков | [Страница](mods/red4ext.md) |
| **redscript** | 0.5.x + PR 206 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/02_redscript_PR206_CP250_Unofficial.zip) — Сборка CI из pull request | [Страница](mods/redscript.md) |
| **ArchiveXL** | 1.27.5 + PR 31 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/03_ArchiveXL_1.27.5_CP250_Unofficial.zip) — Локальная сборка порта сообщества | [Страница](mods/archivexl.md) |
| **Input Loader** | 0.2.3 + main + 2.50 SDK | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/04_Input_Loader_0.2.3_CP250_Unofficial.zip) — Локальная пересборка исходников авторов | [Страница](mods/input-loader.md) |
| **Mod Settings** | 0.2.21 + PR 33 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/05_Mod_Settings_0.2.21_CP250_Unofficial.zip) — Локальная сборка порта сообщества | [Страница](mods/mod-settings.md) |
| **Codeware** | 1.20.6 + PR 63 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/06_Codeware_1.20.6_CP250_Unofficial.zip) — Локальная сборка порта сообщества | [Страница](mods/codeware.md) |
| **TweakXL** | 1.11.5 + PR 22 | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/07_TweakXL_1.11.5_CP250_Unofficial.zip) — Локальная сборка порта сообщества | [Страница](mods/tweakxl.md) |
| **Quickhack Hotkeys** | 2.3.2 + local compatibility patch | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/08_Quickhack_Hotkeys_2.3.2_CP250_Local_Patcher.zip) — Отдельный локальный патчер | [Страница](mods/quickhack-hotkeys.md) |
| **Equipment-EX** | 1.2.9 + local compatibility patch | [ZIP](https://github.com/Nevarielle/cyberpunk2077-2.50-community-fixes/releases/download/v0.2.0-cp250/09_Equipment_EX_1.2.9_CP250_Local_Patcher.zip) — Отдельный локальный патчер | [Страница](mods/equipment-ex.md) |
| **AutoLoot** | 3.11.2 personal customization | Not distributed / Не распространяется — Личная доработка описана; файлы не распространяются | [Страница](mods/autoloot.md) |

## Как устанавливать

- **00–07:** закройте игру, замените соответствующую старую версию через Vortex, оставьте включённой одну копию и выполните Deploy. Зависимости указаны на странице выбранного компонента. Сохраните старые архивы и резервную копию сохранений.
- **08–09:** это отдельные локальные патчеры. Скачайте точный оригинальный ZIP у автора, распакуйте патчер, откройте **Patch-Mods.html**, создайте и сохраните исправленный ZIP. Затем установите полученный архив в Vortex. Оригиналы этих модов не перепубликуются; браузерный инструмент не отправляет файлы на сервер.
- **AutoLoot:** личная доработка 3.11.2 описана отдельно. Для публикации доработок авторы требуют разрешение; её архив, код, настройки и патчер не включены.

CET 1.38.0 нужен Lua-модам на CET; для Quickhack Hotkeys он не требуется. Обновление CET само по себе не обновляет каждый Lua-мод. При появлении совместимых официальных обновлений лучше переходить на них.

## Что проверено

Проверены запуск CET и базовые Lua/TweakDB/RTTI-вызовы; загрузились пять нативных библиотек, скомпилировались скрипты. Пользователь подтвердил работу клавиш взломов. Проверки отдельных возможностей и ограничения перечислены на страницах модов. Личная доработка AutoLoot прошла 24 проверки поведения и проверку синтаксиса 10 Lua-файлов; помощник не проверял её в живой игре.

Создатели модов, авторы портов 2.50 и вклад проекта перечислены в [CREDITS.md](CREDITS.md). CET и чужие порты не представлены как код, написанный Codex. В публикацию не входят игровые бинарники, сохранения, личные настройки или резервные копии. Контрольные суммы — в `SHA256SUMS.txt`.
