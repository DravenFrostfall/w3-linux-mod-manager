<p align="center"><img src="icon.png" width="128" alt="W3 Linux Mod Manager"></p>

# W3 Linux Mod Manager: Changelog

Newest first. Versions match the ones on Nexus. From 1.0 on, fixes raise the last number (1.0.1) and new features the middle one (1.1). Before 1.0, "b" meant beta.

## 1.0 · 2026-11-19

**New**
- The app is now called W3 Linux Mod Manager, and has its own icon.
- "Check Nexus for updates" works without a Nexus account: no login, no key. The ↑ tooltip shows the mod's changelog for each version after yours.
- An outlined ↑ when a mod's page has a newer version but Nexus doesn't say which file is yours.
- A mod's in-game menu has its own window in the app: click the menu sign next to its name, or right-click → Mod settings…. Pages, presets, switches, sliders and dropdowns, with the mod's own names and descriptions in your game's language (pictures included). It opens on the values the game has now, and Save writes only what you changed.
- "Hide the Menu in-game": a mod's page is left out of the game's menu while its settings keep working.
- A mod whose menu folder holds a single page opens it straight away (Settings → Mod list turns this off).
- A mod's own menu can be left out: untick "Mod menu" in the Install or Edit window.
- See a merged file whole: click a script in a ✓ Merged tooltip. Each change is marked with the mod it came from, Previous / Next jump between them, and hovering the file name shows the game's original.
- Scripts that won't compile are flagged before you start the game (a red ƒ, "Won't compile"), naming the missing or switched-off mod when there is one.
- Precompiled scripts (.rsblob) can be read: right-click → Precompiled scripts… shows them decompiled back to WitcherScript. The decompiler is ported from W3 Mod Workbench by Faen90 (MIT).
- A mod that's mostly or fully overridden by others says so in its clash tooltip, and so does one whose script changes are mostly unused.
- `.ini` files mods put in `bin/` are merged key by key instead of replacing each other or the game's. Your own edits are kept.
- Group mods yourself: select them, right-click → "Group N mods". A group without a main mod gets a header row you can name, fold and switch on or off.
- Keybind presets: a mod that's only an input.settings swaps in its sections, and yours come back when it's off or removed.
- Keys a mod adds with a Windows script (a .bat like Music Plus's installer) are added by the app, and taken out with the mod.
- "Turn all mods off" marks the mods it switched off, so you can turn them back on a few at a time to find a problem mod. "Turn marked mods back on" restores the rest.
- Uninstalling a mod offers to remove files its tools made (ReShade presets and logs, a plugin's cache) and files left in its own folder.
- ••• → "Merge again" rebuilds every merge from scratch, keeping or clearing your Script decisions.
- The mod list and the Downloads panel point at each other: select a mod to see the download it came from, click a download to find its mod.
- The Downloads panel is always there, for the archives you install from your own files.
- The header shows how many bundles the game loads from your mods.
- Icons for every kind of file and a Size column in the Install and Edit windows' folder trees.
- Settings links to the project's GitHub page.

**Improved**
- Update detection is far more reliable: files renamed or re-uploaded on Nexus, a file archived and replaced by a new one, a file the author deleted, and versions written in file names are all handled. An update you already have no longer shows.
- An update check first asks Nexus which mods changed, so a fresh update always shows and far fewer requests are made. The status line says how many updates it found.
- Every mod's priority is its own: patches and optional files no longer move along with their main mod.
- Mods others build on (like Shared Utils) are always kept below them in priority, so their scripts compile.
- The same file packed byte for byte in two mods' bundles is no longer a clash.
- Clash tooltips: the winning mod in blue, counts out of the mod's total ("Textures 3/10"), and which mod kept each clashing key.
- One ƒ chip for every function more than one mod's scripts claim: red when it can't work, amber when only one version is used.
- Tooltips grow past the app's window when needed, get wider before they scroll, and split long file lists into columns.
- Status chips show just their icon; Settings → Mod list brings the counts back.
- A section holding a mod you just installed gets a bronze edge, so you can see where it went.
- Clicking "Mod Manager Download" for a file you already have shows its card instead of downloading it again.
- Right-click a download → "Open in Downloads folder" selects the file in your file manager.
- Detect Steam install finds Snap installs of Steam, and a prefix left in another Steam library.
- Script Merger (legacy) is drawn at your screen's scale and can be started again right after closing.
- `.7z` and `.rar` archives made on Windows with backslashes install into the right folders.
- A word after a version number ("3.1.0-lod", "2.0 Final") is no longer read as part of it.
- Code in Script decisions and merged files is easier to read: changed lines get a gold number instead of a coloured background.
- Error windows can be resized.
- Shorter, plainer tooltips and hints throughout.

**Fixed**
- Settings could all reset on the next game start after installing a mod that writes its own .ini report (Immersive Gear - Upgrade Kits - Hardcore).
- ReShade's settings didn't stick: its .ini values doubled with every save.
- Switching a mod off and on lost the values set in its menu and the keys you'd rebound for it.
- Mod settings changed in the app while all mods were off didn't stick.
- Updating a mod could remove its add-on (Music Plus and its Music Pack).
- A mod menu's names and values given by its scripts showed wrong until the game had run (Food Rebalance).
- Settings a mod's menu hides (hideAlways, or a script's condition) showed in the app.
- A mod's settings saved in its own section (overrideGroup) were read and saved in the wrong one (No Artificial Player Light).
- A mod's strings in a mixed 4.x/5.00 format were taken as unreadable.
- An archive with only settings files was installed as a mod folder the game ignores.
- "Move file to Trash" on a second drive seemed to delete files for good. Files now go to the Trash your file manager shows.
- When Nexus stopped answering mid-check, an error window popped up. Now the check stops and keeps what it found.
- An update's changelog could stay missing for good if it couldn't be fetched the first time.
- Clicking a download's trash icon could make the Downloads list jump.
- The "Also remove?" window on uninstall could stretch far too wide.
- Dividers and icons looked blurry or uneven at 125% and 150% scaling.
- Selecting code in Script decisions was unreliable, and scrollbars were hard to grab.
- Faster start: the game's scripts are read once and kept, strings are read four times faster, and the mod list isn't saved when nothing changed.
- A damaged bundle could stop a merge with an error.

## 0.5b · 2026-10-10

**New**
- Support for The Witcher 3 Remastered (5.00, 5.01), detected automatically. 1.x and 4.x work as before.
- Red and amber chips for mod files that won't work on 5.x.
- Precompiled scripts (.rsblob) are read, and mods that add or replace the same game function are flagged.
- Texture, sound and text (.w3strings) clashes are detected and get priority numbers.
- Mods made for older game versions merge without undoing the game's later changes.
- "Log in with Nexus" replaces the API key.
- Turn all mods off and back on in one click, with your mod menu settings kept exactly.
- Click a mod in a clash tooltip to make it win.
- Tooltip file lists say what each kind of file is, folded to one line per kind.
- A small sign marks mods that add an in-game menu.
- Ignore one update of a mod from its right-click menu.
- Sections show how many of their mods are on, and "New section above" is in a mod's right-click menu.
- The app moves itself into the game's `_ModManager` folder and leaves a shortcut where you started it.
- The launcher sets up PyQt6 by itself when your system doesn't have it.
- Reads a mod's info file (REDkit's `info.json`) for its name and version.
- Old archives go to the Trash after an update.

**Improved**
- Much faster start and list redraws, and nothing is sent to Nexus at start.
- Original game files for merging are downloaded once and kept.
- Chips about the mod itself are outlined, and updates are light blue everywhere.
- Opening a section scrolls its mods into view.
- The Install and Edit windows fit their file list to its contents and the screen.
- Tooltips list every file, and notes under a file are easier to read.
- A notice lists mods not installed with the app ("Import existing mods" is gone).
- A mod whose only old file is its collision.cache gets an amber chip, not red.
- Tidier Settings window, ••• menu and window colours.
- The update check says how many mods it's asking about.
- The ⚙ chip's tooltip lists every settings line a mod added.

**Fixed**
- Turn all mods off could leave every mod in the game after a switch went wrong.
- Updates reset your mod menu values and rebound keys.
- A new version the author renamed on Nexus wasn't seen as an update.
- File names in REDkit-built bundles were misread, hiding clashes.
- Files were judged old by their archive dates instead of their own format.
- Quick checkbox clicks were sometimes ignored.
- The Install window said "Install" for another version of a mod you have.
- "Add keybinds by hand" showed for readmes without keybind lines.
- The update check stopped when one mod page was hidden.
- A placed file you saved in an editor was replaced on every sync.
- The downloads panel could be dragged narrower than its cards.
- A hand-installed mod's priority in the list could differ from mods.settings.
- Settings values with rare characters were split, and values changed only in dx12user.settings were reset.
- Already-converted UTF-16 texts got a needless "older patch" chip.

### Details

**The Witcher 3 Remastered (5.00 and 5.01)**
- The game version is detected by itself: 5.x has UTF-8 scripts and no DX11 build (`bin/x64`). Everything 5.x-specific below applies only there. Going from 4.x to 5.x and back works with mods installed, and removing every mod leaves a clean game on either version.
- On 5.x, old mods' UTF-16 scripts, XML and CSV go into the game as UTF-8 copies (the mods' own files are never changed), merged files are written in UTF-8, and DX11 files are held back. `dx11filelist.txt` / `dx12filelist.txt` don't exist on 5.x, so they're left out. On 4.x all of this works as before, and coming back to 4.x puts it back.
- Red chip for files that won't work on 5.x: packed XML/CSV in UTF-16, `.w3strings` in 4.x's format, old SpeedTree files, old `soundspc.cache`, UI files 5.00 changed, or a mod made only of DX11 files. The warning says they use an old format the Remastered no longer reads, as CDPR's support page puts it.
- A mod whose only old file is its `collision.cache` gets an amber chip and a plain note instead of red. The game most likely ignores the cache, so its collision and physics shapes may be missing, but the rest of the mod works. Classic-game caches (versions 1 and 2) show "1.32" on the chip; next-gen 4.x ones (version 9) are recognised too.
- Game-version detection knows 4.04b, 5.00b, 5.00c and 5.01, and tells patches apart. A mod made for 5.00 gets the amber "older patch" chip on 5.01. The "in game" chip also covers mods the Remastered made unneeded.
- Old mods are rebased onto your patch's own game files. A one-time notice explains the changes on the first start with 5.x.
- The script view colours the new `map<>` and `set<>` types.
- Note: `dx11filelist.txt` / `dx12filelist.txt` going missing (reported 30 Sep) was the 5.00 update removing them, not the app.

**Reading mod files by their own format, never by dates**
- `.w3strings` (4.x's UTF-16 layout and 5.00's version 164), `collision.cache` (versions 1, 2, 9 and 11), bundles and precompiled scripts are each read by their own header. Archive dates are never used. Only a mod file's Nexus upload date counts, and without one a file isn't flagged.
- A mod built with REDkit 5 is taken as made for the Remastered, so its other files are never called old.
- Bundles built with REDkit use a smaller table entry than 4.x's. The app read their file names out of step before, so clashes and XML merges were missed. Both layouts are read now.
- REDkit's `info.json` gives the mod's name and version. Its `gameVersion` is a REDkit number, not a game patch, so it's ignored.
- Each format was checked against real files from mods and the game.

**Clashes**
- Texture (`texture.cache`) and sound (`soundspc.cache`) clashes get the ⚠ chip and priority numbers, so your order decides which one the game uses. Only each cache's table of contents is read, so even multi-GB caches are quick. An unknown layout is skipped, never wrongly flagged.
- Text clashes: two mods giving the same text ID different words clash. The same words don't (a mod and its own patch). In the tooltip all of a mod's text clashes are one line, "Texts (.w3strings)" with a count.
- Precompiled scripts (`precompiled.rsblob`) are read: the classes, enums and functions they define, and what they add (@addMethod, @addField), replace (@replaceMethod) or wrap (@wrapMethod). Two mods adding the same method or variable, or replacing the same function, get the red @ chip, "Won't work together". So does a mod whose copy of a game script changes a function a precompiled mod replaces. Wrapping the same function is fine, and so is a class two precompiled mods both carry (tested in game with Brothers in Arms and Quest Tweaks). A file that can't be read is noted, never guessed at.
- Only clashes the app can actually see get priority numbers.

**Merging mods made for older game versions**
- A mod's copy of a script or XML made for an older version (1.32, say) used to look like it deleted everything CDPR added since, causing false conflicts and stripping newer code. Now it's compared with the file it was made from, and only the mod's own changes are merged onto your game's file. Where the game changed the same lines since, the mod's version of those lines is used.
- The original files are downloaded once from the public game-script archives on GitHub and kept in `_ModManager/vanilla`. A file a version doesn't have is remembered too. Offline, merging works as before.

**Priority and clash tooltips**
- Click a grey mod's name in a clash tooltip and the two trade priority numbers. Every other mod keeps its number, and neither moves in the list or between sections. A patch from the same Nexus page moves along with its main mod. The tooltip comes back in place showing the new winner.
- Files are grouped by kind with a short label ("Quest steps", "Scenes", "Textures", about 50 kinds, from the RED modding wiki), each folded to one line with a count. Click to open or fold. Labels are blue; file names are grey with darker extensions. Story files come first, then the rest, then looks. A mesh's `.buffer` files share the mesh's line.
- Tooltips list every file (no more "… and N more") and scroll. One a few lines taller than the window grows to fit if the screen has room.
- A note about one file sits indented under it in a dimmer grey: in "Merged", the functions both mods changed ("Both changed OnGameCameraPostTick"); in "Not merged", why.
- The hand-installed mod fix: when none of the app's own entries are left in mods.settings, the file is given back exactly as you had it, and the list now shows your numbers too. Nothing wrong was ever written to the file.

**Mods with an in-game menu**
- A grey sliders sign at the right edge of the mod's name (dimmer when the mod is off) marks mods with their own menu files in `bin/config/r4game/user_config_matrix/pc`. Hover it for the files. A long name is cut short before it. A copy of one of the game's own menu files there (input.xml, gameplay.xml) doesn't count.

**Turn all mods off and on**
- ••• → "Turn all mods off" gives a vanilla game in about a second: the `mods` folder and the mods' `dlc` folders move into `_ModManager/parked`, replaced game files get their originals back, and mods.settings and the lines mods added to the settings files come out. "Turn mods back on" puts it all back as it was. Nothing is deleted, merged or installed again.
- While off, the list is dimmed. Installing, removing, switching or reordering still works and applies when mods go back on. Not while the game is running. A switch cut short is finished on the next start.
- Your mod menu values come back 1:1. While mods are off the game runs without their menus and may drop those values. The app keeps a copy of each mod menu's section in user.settings and dx12user.settings, and on turning back on adds only the missing lines, each where it was. Nothing that's there is changed, moved or removed. Which sections are a mod's is read from its own menu file. Nothing comes back for a mod removed while off, or for a setting its update dropped. It adds about 0.1 s at most.
- The fix: a folder with the same name as a parked one, added while mods were off, kept the parked one from going back, and the next "off" then left every mod in the game. Removing mods after that could leave traces. Now such a folder is kept in `_ModManager/kept aside` (named in the status tooltip, never deleted). Checked against 24 more situations, including power cuts mid-switch.

**Updates**
- An update takes over what the old version added to your settings files, so values you set in its menu and keys you rebound stay as you left them. Keys the new version dropped come out, and new ones go in. Checked on 4.x and 5.x along with everything else an update touches.
- A file the author renamed on Nexus ("Main files (5.0)" to "Main files (5.01)") is still recognised as an update, using Nexus's own record of which file replaced which. Every such link is kept, so your version still leads to the newest one if a page drops an old link.
- The Install window says Update, Reinstall, Downgrade or Replace from the start for another version of a mod you have, keeps its name, section and Nexus ID, and doesn't ask again.
- After an update, the old version's archive and older unused downloads of the same file go to the Trash. A newer archive is never touched.
- Right-click → "Ignore update 1.2" hides the ↑ chip for that one version until a newer one comes out. Works on several mods at once.
- The ↑ chip and a folded download card with a newer version are light blue, so green only ever means "fine". The update check says how many mods it's asking about, skipping ones checked in the last few hours, and goes on past a hidden or removed page (that mod gets ⊘).

**Nexus**
- "Log in with Nexus" in Settings replaces pasting an API key, as Nexus requires for public apps. It switches on once the app's Nexus slug is filled in (`NEXUS_APP_SLUG`). Until then the app doesn't talk to Nexus at all; everything else works, including the GitHub downloads for merging. A key saved earlier is kept but unused.
- For the developer's testing, his own key (recognised by its SHA-256 fingerprint, never stored in the script) still works as before.
- Starting the app no longer contacts Nexus. The allowance in the footer shows after your first check or download.

**Speed**
- From launch to your mod list went from about 0.6 s to 0.25 s, and the first redraw is several times quicker. The app starts from a ready-to-run copy of itself (`_ModManager/w3modmanager.compiled`), remembers your game's version (`game_versions.json`) and what it read from mod files (`scans.json`). A file is read again only when it changes, and a deleted or damaged cache is simply rebuilt.
- With 280 `.w3strings` files, the first redraw went from 1.06 s to about 0.25 s. The downloads panel fills twice as fast. A wheel guard now only looks at the widgets it protects, which halved redraw time.
- A slowdown from the precompiled-script check (0.17 s to 0.38 s per redraw) is fixed: its answers are kept in scans.json too.
- `W3MM_PROFILE=0.2` writes to `perf.log` what took longer than 0.2 s. "app started" says how long the start took.

**The app's own folder and launcher**
- On first start the app asks for the game folder and prefix, then moves itself into `<game>/_ModManager` with its settings, launcher and Python setup, and leaves `shortcut_w3lmm.sh` where you started it. A `_ModManager` folder that isn't the app's is never used.
- To update the app, extract the new release (or just the `.py`) next to the shortcut and start it: the new version moves in and nothing is asked again. Each start keeps the launcher and shortcut up to date. Changing the game folder in Settings moves the app to that game's `_ModManager`, and each game keeps its own data.
- The launcher runs the app with your system's PyQt6, or sets up a private one in `w3modmanager_venv` on first start (uv if you have it, else Python's venv and pip). Started twice during that setup, it waits. Checked on Python 3.10 to 3.13. `--install-desktop` / `--remove-desktop` add or remove a menu entry (nothing is added unless you ask), `--reset` deletes the private setup.

**Mods not installed with the app**
- "Import existing mods" is gone: it could only take over a folder in `mods/`, not the dlc folders, menu files or settings lines that came with it, so such a mod could never be removed cleanly. A notice now says how many such mods there are (names in its tooltip). They're left as they are and still get a priority when they clash. "Hide" hides the notice until the set changes. Mods imported earlier work as before.

**Windows and list**
- Install and Edit windows: the file list grows the window just enough for its rows, follows as you open folders, and stops at the screen's edge (then it scrolls). A height you set by hand is kept and never shrunk. On Wayland the window is assumed to be where KDE puts dialogs, since apps aren't told where they are.
- Sections show "4/6" (mods on, of how many), updated as you tick. Opening one scrolls just enough to show its mods.
- Chips about the mod itself (game version, "in game", ⊘) are outlined; clash and merge chips stay filled.
- Settings window: three groups (Game, Nexus, Script decisions), aligned fields, equal-width buttons, explanations in tooltips, and "Detect Steam install" as a link under Prefix.
- "Script decisions…" only shows in the ••• menu when there's something to decide. ••• → Open with no prefix set says so, with a button to set it.
- Window background #191d25, list and inputs #21272e, quieter grid lines.
- The ⚙ chip's tooltip lists every line a mod added (keybinds, user.settings values, input.xml entries), by file and section.

**Other fixes**
- Clicking checkboxes quickly: a click made while the previous change was being applied was ignored. Now it ticks at once and is applied right after. A box clicked twice ends up as it was.
- "Add keybinds by hand" now only shows when a readme has keybind lines (`IK_Key=(Action=…)`) outside a `[Section]`, not for one that merely names a settings file.
- A placed file you saved again in an editor is no longer removed and placed again on every sync.
- The downloads panel's minimum width follows its cards, with the scrollbar clear of them.
- Settings files are only split at real line breaks, so a value holding U+2028 or a form feed stays one line. A readme value you changed only in dx12user.settings is remembered for that file.
- Mods whose UTF-16 text files the app already converts no longer get the "older patch" chip.
- The version tooltip is one line ("Made for 4.x, your game is 5.00c") without guessed dates. No long dashes anywhere in the app's text.

## 0.3b · first release on Nexus

**New**
- Game-version detection: each mod's copies of game files are matched to the version they came from (1.10 to 4.04a). Red chip for pre-next-gen files and UI mods, amber for another patch, also warned about in the Install window.
- "In game" chip for mods the next-gen update made unneeded.
- Archives you install yourself get a card in the downloads panel; ones from Downloads, the desktop or temp move into the app's downloads folder.
- Right-click menu in the downloads panel; one filter box for mods and downloads.

**Improved**
- The update check compares each mod with its own file on the Nexus page: no more false updates on optional files, and their names no longer repeat the page name.
- After installing, the new mod is selected and scrolled to.
- Priority pills in tooltips, menus with rounded corners and icons, "Open readme" only when there is one.

**Fixed**
- Dragging mods never changed priority (Qt cleared the selection on drop).
- Game config files a mod installs (`rendering.ini`) were read as readme instructions and copied into `user.settings`.
- Settings files: a key rebound in the game menu is followed, keys the game already uses are flagged, your tuned values come back after switching a mod off and on, non-UTF-8 bytes survive.
- A file replaced by a game update or an editor is now told apart (your edit, the game's new file, or a rebuilt merge).
