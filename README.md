<p align="center"><img src="icon.png" width="160" alt="W3 Linux Mod Manager"></p>

<h1 align="center">W3 Linux Mod Manager</h1>

<p align="center">A mod manager for The Witcher 3 on Linux (Proton/Wine), for every game version.</p>

## What it does

- Installs and removes mods cleanly. Taking a mod out leaves no traces behind.
- Merges script and XML conflicts between mods, and asks you only when two mods really clash.
- Shows which mods clash on files, textures, sounds and keybinds, and lets you set who wins.
- Adds the settings and keybinds a mod's readme asks for, and takes them back out with the mod.
- Groups the files of one mod together, with sections you name yourself.
- Works with the old game (1.32), next-gen (4.x) and the Remastered (5.x), on GOG and Steam.

## What it needs

- Python 3 and PyQt6. On Fedora: `sudo dnf install python3-pyqt6`.
- No PyQt6 (Steam Deck, for example)? The launcher sets it up by itself the first time, in a folder next to the app.

## How to start it

1. Download `w3modmanager.py` and `w3modmanager.sh` into the same folder.
2. Run `bash w3modmanager.sh`.
3. On first start the app asks for your game folder and its Proton/Wine prefix. It then moves itself into `<game>/_ModManager` and leaves `shortcut_w3lmm.sh` where you started it. Use that shortcut from then on.

To update, put the new files next to the shortcut and start it. The new version moves in, and nothing is asked again.

## Nexus

Update checks and "Mod Manager Download" links need a Nexus login. That switches on once the app is registered with Nexus. Until then the app doesn't contact Nexus at all, and everything else works.

## More

- [CHANGELOG.md](CHANGELOG.md): what changed in each version.
- License: GPL-3.0.
