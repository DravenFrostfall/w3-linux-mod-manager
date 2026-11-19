<p align="center"><img src="icon.png" width="128" alt="W3 Linux Mod Manager"></p>

# W3 Linux Mod Manager: Changelog

Newest first. Versions match the ones on Nexus. From 1.0 on, fixes raise the last number (1.0.1) and new features the middle one (1.1). Before 1.0, "b" meant beta.

## 1.0 · 2026-11-19

**New**
- "Check Nexus for updates" works without a Nexus account: no login, no key. Changelogs in the ↑ tooltip too.
- The Downloads panel is always there, for the archives you install from your own files. Only downloading straight from Nexus waits for the login.
- Settings links to the project's GitHub page, next to the version.
- The mod list and the Downloads panel point at each other. Select a mod and the download it was installed from gets a steady bronze edge in the panel, scrolled into view only as far as needed: the exact file first (its own sub-card when its page's card is open), else its Nexus page's card. Several mods light up their page's card when they share one; mods from different pages, or one with no download, light nothing. It only works while the panel is open, and never opens it. The other way: click an installed download (the hand and a short tooltip say which ones) and its mod is selected in the list and scrolled to, its section opened if it's folded; click a page's card beside its files and every mod installed from it is selected. A download that isn't installed does nothing. The flash for a file you download again is now the brighter bronze, so it still shows on a card that's lit.
- A mod whose folder in the game's Mods menu holds a single page now opens it straight away: Mods › Dynamic Scabbards shows its settings, not Mods › Dynamic Scabbards › Settings. A folder with several pages (Rational UI's Alchemy, Crafting and Inventory Icons) stays as it is. Worked out at every sync over every menu the game reads, other mods' and ones the app doesn't place included, so a folder becomes one again when a second page joins it. Never done for a page a mod's script finds by its name (Sharedutils' descriptions, a script watching menu pages open), which would stop working. The app places a copy of the menu file with the page's place changed and nothing else; the mod's own file isn't touched. Settings → Mod list → "Open a mod's only menu page directly" (on by default) turns it off.
- "Hide the Menu in-game", a switch in a mod's settings window: its page is left out of the game's own menu while its settings keep working and keep their values (change them in the app). The app places a copy of the mod's menu file with every setting still defined but marked visibilityCondition="hideAlways", the game's own condition that nothing ever turns on (the way Rational UI hides one of its settings on 5.01, its value still kept), and without its presets, which the game would otherwise show; a page with nothing to show isn't listed in the game's menu. Each hidden page also gets a one-level place of its own in that copy: for a page two levels deep (Mods › Brothers In Arms › Optional Content) the game would otherwise take back only the page and leave its folder behind, with just Back in it. Where the values are kept doesn't depend on it. Deleting the menu file instead would lose the settings: the game keeps values only for settings a menu file defines. The mod's own file is never changed, switching it back places it again, the choice is kept through updates, and a hidden menu's sign in the list is struck through with a dark red stroke (its tooltip says so too), so it shows at a glance.
- A mod's in-game menu has its own window in the app: click the menu sign next to its name (it turns gold under the pointer, with the hand), or right-click → Mod settings…. Its pages are listed on the left, each page's presets sit on top, and its settings are in the middle: switches as checkboxes, sliders with the mod's own range and steps, lists of choices as dropdowns, and the menu's section headings. It opens on the values the game has now, from the settings file the game you play reads (dx12user.settings for 5.00, user.settings for the classic game, and for 4.x whichever of the two the game wrote last); for a mod whose menu is out of the game (switched off, or all mods off), on the values the app keeps for it. The menu's defaults show only where there's no value at all. Names and descriptions come from the mod's own strings in the game's language (TextLanguage in its settings), English where the mod has none: its .w3strings files, or plain-text string tables (.csv, .txt, .strings). Labels follow the game's own rules, including the menu's customDisplayName, customNames and nonLocalized tags. Point at a setting to read its description at the bottom, as the game's menu shows it (there only, not again in a tooltip; a description with pictures is a tooltip instead, below): from the mod's scripts, whichever way it gives them (Sharedutils' menu descriptors, used by Brothers In Arms and Rational UI, even when another mod describes the menu; or its own change to the game's SetDescriptionText, as Better Candles does), with their colours, line breaks and italics. When the pointer isn't on a described setting, the card shows the page's own text if the mod gives one ("Version 4.1.0. This is the mod menu for…"), else nothing; a mod with no descriptions has no card. The card keeps its height on a page, growing only for a longer text. Names a mod's menu takes from another installed mod's strings (another part of the same mod, say) are found too, and a section heading named nowhere shows no text rather than its raw key. A description a mod's script builds with its own functions (Rational Inventory Icons joins texts and pictures that way) is worked out as the game would; one the app can't work out is left out, never guessed. A description with pictures (Rational Inventory Icons' example icons) shows as a tooltip on its setting rather than in the card; a mod whose descriptions are all pictures has no card. Rows of pictures under short headings ("Vanilla:", "Tiered:") are laid out with each heading beside its pictures. Pictures in a description (img://icons/…) are shown at the size it names, read from the texture.cache that holds them: the mods that are on first, then the game's DLC and content (DXT1, DXT5 and plain-colour textures); one that can't be found is left out. Names a menu takes from the game's own strings ("title_alchemy" is the game's Alchemy) are looked up there last, reading only the strings needed. Only the name the game itself looks for (preset_value_…, option_…, panel_…) is looked up in other mods' and the game's strings; the app's looser guesses stay in the mod's own, so a preset can't show some unrelated text another mod keeps under its plain name. A preset or a choice sets every value it lists, in whichever section it names (a game section like [Rendering] too); an entry that names no section sets the page's setting of that id wherever that setting is kept (Brutal Blood's Disable and Enable did nothing: they set its [Rendering] and [Budget] settings, and the app put them in a new [dec] section instead). A choice that lists no values is saved by its position, as the game does. Changed values turn gold and are counted. "Reset page to mod defaults", a quiet link at the bottom left, sets the page back to the values the mod gives it (a setting the mod gives no value is left as it is: Brutal Blood's used to go to 0); it only shows when none of the mod's own presets sets exactly those, and is greyed while the page already has them. Save writes only what changed into user.settings and dx12user.settings: a key changed where it is (in every section of that name it's in), a new one at the end of its section, the rest of each file untouched. For a mod whose menu is out of the game, the new values also go into what the app keeps, so they're the ones that come back with its menu. Nothing is written while the game runs, or before the game has made its settings file. A value saved between a slider's steps stays exactly as it is until you move that slider. A slider's box shows the number as the game does ("2" for a saved "2.000000", which stays as it is in the file), and every slider's box is as wide as the widest value any of them can show, so nothing is cut off and the sliders still line up. The mouse wheel scrolls the page past sliders and dropdowns without changing them, until you click one. The window's look: each section of a page in its own card; on/off settings as switches; sliders with a slim bronze bar and a round handle, their value in a small box beside them; a changed setting marked with a gold dot and its value box turned gold, and a gold dot on each page in the list that has changes; the selected page with a bronze bar; presets as rounded buttons, the one your values match lit; the description in its own card at the bottom; dropdowns set apart from the card they sit on (dark like the value boxes, with a lighter edge), their open list a step lighter than the page with a clear border and the same soft shadow as the menus and tooltips, the hovered entry in soft bronze. Every setting's row is the same height, and its control the same visual weight: dropdown fields are as tall as a slider's value box (they were taller, so rows with dropdowns looked packed next to rows with switches). Dropdown fields are as wide as the longest choice any of the window's dropdowns has (all the same width, between 150 and 300 pixels, at the right end of their rows like the switches), so a few short choices get a short field. The open list is always wide enough for its longest choice, growing to the left from the field's right edge; a choice too long for the field is cut short there only. The open list drops under its field (above it near the bottom of the screen) and is tall enough for all its entries, up to ten before it scrolls, with a scrollbar like the tooltips' (a longer list had none): some lists used to cut off their last entry behind a scroll arrow, or open scrolled one entry down with a gap at the bottom (on Wayland, where the list's size arrives a moment late). Long names (in German, say) fit or wrap instead of being cut off; a switch or a dropdown takes only its own width, so a name has the rest of its row and wraps only when it doesn't fit (in a narrower window they wrapped with half the row free). A setting the mod tags "indent" sits indented under the one above it, as in the game (Enhanced Camera's Idle Timeout under Idle Camera Rotation), joined to it by a thin tree line in a quiet grey a step lighter than the dividers; the divider above it starts at its name. A divider with no heading is a short gap between cards, not the room a heading takes. The scrollbar's room is always kept, so every page has its cards and switches in the same place, whether it scrolls or not. A description colour too dark for the card (Brothers In Arms' deep blue) is lifted just enough to read, its hue kept. A list of choices that's really a scale (at least 8 numbers going up or down, like No Artificial Player Light's 0, 0.1 … 2.0) is a slider over its choices instead of a long dropdown, the choice in the value box beside it; a choice the mod notes ("1.0 (Default)") gets a small tick under the track, and the box's tooltip shows the note there. What's saved is the same as picking it from the list. Lists of words stay dropdowns. A list of just two choices that's really a switch (OFF / ON, No / Yes, Disabled / Enabled, either way round) shows as a switch like the menu's own on/off settings, and saves what picking that choice would.
- When a mod's Nexus page says a newer version than yours but no file there can be told to be your file's update (uploaded under another name, with nothing on Nexus saying what it replaces), the row gets an outlined ↑: "You have 2.0.3 · The page says 3.0. Nexus doesn't say which file it is. Check the mod's files on Nexus." Only when your file is no longer offered on the page (so a second "main" file still on it, like Global Lighting Fix V2 next to Better Vanilla Lighting Changes, never gets the page's version), only for the page's main mod in your list, never next to a real update, and right-click → Ignore update hides it like one.
- Uninstalling a mod with files in bin/ also offers what its tools made there while the game ran (ReShade's log, presets and shader folder next to the game's exe, a plugin's cache). The app notes what's in each bin/ folder a mod uses when it's installed; what shows up there later that no mod placed is listed. The window lists every such file, in bin/ and in the mod's own folders, with a checkbox and its size: ticked when only that mod can have made it, unticked with why when it can't be sure ("Maybe Dynamic Grass's" when another mod staying installed uses that folder and the file appeared after it came; "Made after it was installed" for a mod installed before this version, where only the time tells). Ticked files go to the Trash, and a folder they leave empty goes too; the bin/ folder itself and the game's own files stay.
- "Turn all mods off" is made for finding a mod that causes a problem: it unticks every mod that's on and marks each one, its checkbox outlined in bronze (mods that were already off get no mark). Tick mods back on one or a group at a time; a mark goes as soon as its mod is on again. While marks are left, the same ••• entry reads "Turn marked mods back on" and puts them all back. Marks last through a restart and an update, and go with a mod you uninstall. Ticking a main mod back on brings its linked files back with it, as when you untick it. A mod back on keeps the time it arrived, so which mod a clash is flagged on doesn't change. Script Merger's own folder (mod0000_MergedFiles) stays off while mods are marked: what it merged holds their code. Folders in the mods folder that the app doesn't manage stay as they are (the status bar's tooltip says how many). It replaces the old switch that moved the mods folder aside (a switch made with an older version still turns back on as before).
- The folder trees in the Install window and in Edit → Installed files have an icon on every row: a gold folder for folders, and for files a sign of their kind, each in its own colour (scripts, precompiled scripts, textures, models, bundles and caches, sounds, texts and scenes, quests, data and settings files, menus, DLLs, world files; a plain sheet for anything else). Drawn in code, no image files. A new Size column, right-aligned, gives each file's size and each folder's total. The same icons are on each kind's line in the clash and merge tooltips ("Textures 3/4", "Scenes"…; the file lines under them stay plain), and a folder icon on each folder in the Install window's Archive contents. Sound files are named like the other kinds: "Sound banks" (.bnk) and "Sounds" (.wem).
- The app is now called W3 Linux Mod Manager.
- Clicking "Mod Manager Download" for a file you already have scrolls to its card and flashes it instead of downloading it again.
- The header shows how many bundles the game loads from your mods, with the list per mod in its tooltip.
- `.ini` files mods put in `bin/` (rendering.ini, a plugin's settings…) are merged key by key instead of one replacing the other or the game's.
- The app has its own icon: in the title bar, the taskbar and Alt+Tab, and with its name and version at the bottom of the Settings window.
- The ↑ update tooltip shows what the mod's changelog on Nexus says for each version after yours, newest first. Each line starts with a round dot.
- Keys a mod adds with a Windows script (a .bat like Music Plus's "Install-MusicPlus-Keys.bat") are added by the app itself, as for keys in a readme, and taken back out with the mod. The scripts are never put in the game; they're kept with the readmes, to read.
- A mod's own menu (its options page in the game's menus) can be left out: untick "Mod menu" in the Install window, or later in Edit…. It's in bold: unlike the rest there, leaving it out can stop a mod from working. The card with these choices is now called "Optional parts".
- Uninstalling a mod lists the files in its own folder that the app didn't put there (saved by the mod's tools, or by you), to keep (the default) or send to the Trash with it.
- ••• → "Merge again" makes every merge again from scratch: mod0000_AutoMerged is deleted from the game's mods folder and from _ModManager/merged, then built anew from your mods. It asks first: "Decide again" clears your Script decisions so each comes up again, "Keep decisions" uses your answers again. Values you changed in merged .ini files stay either way.
- Keybind presets: a mod that's only an input.settings (like "(REMASTERED) Alternate controller layout") puts nothing in the game folder. Each section it has takes your section's place in input.settings; switched off or removed, yours come back, except a section you changed since. It shows in Optional parts ("Keybind preset, 48 sections") and in the ≡ tooltip.
- Group mods yourself: select them, right-click → "Group N mods". A base mod and the mods that need it can now sit together like the files of one Nexus page. A group without a main mod gets a header row that folds, switches them all, and is yours to name.
- See a merged file whole: in a ✓ Merged tooltip, click a script (it lights up under the mouse). It opens as the game gets it, with what the merge changed in full colour, the mod each change came from over it, and everything else greyed out. Previous / Next jump between changes.
- Scripts that won't compile are caught before you start the game: a red ƒ, "Won't compile", on a mod whose scripts point at something no loaded script has. That's an annotation (@wrapMethod, @replaceMethod, @addMethod, @addField) on a class that isn't there, a function its class (and what it builds on) doesn't have, or a class built on a class nothing loaded declares. Usually a mod made for another game version, or one that needs a mod that's missing or switched off: then it says which mod has it ("Shared Utils has it, but it's switched off"). Classes the game's own scripts build on without declaring them (the engine's, like CR4HudModule or IGameSystem) count as there, so a mod's copy of a game script isn't flagged for them. A state is told apart by the class it belongs to: the horse's Exploration state (W3HorseComponentStateExploration) and the player's are two different ones, so Responsive Movement and Combat, which adds to the horse's, isn't flagged any more.
- Precompiled scripts (precompiled.rsblob) can be read: right-click a mod that has them → Precompiled scripts… shows them decompiled back to WitcherScript. In a Script blobs tooltip, click a function's name (it's underlined under the mouse) to see the precompiled mod's own version of it. The decompiler is ported from W3 Mod Workbench by Faen90 (MIT).
- A mod that's mostly overridden says so, in amber, first in its clash tooltip: "Mostly overridden · 38 of 40 files" when more than half of its files (textures or anything else) lose to higher priority mods, "Fully overridden" when all of them do. Keeping it does little or nothing: better to remove one of them. Half or less: nothing extra. Scripts are held to a stricter rule, since a lost script function can leave a mod half working: "Scripts partly unused" in the ƒ tooltip when precompiled mods take all its changes in one of its script files ("None of its changes from damageManagerProcessor.ws are used"), or more than a third of its script changes. The mod might not work properly or work only partly: best to remove one of them, since they're clearly not compatible. All of them: "Scripts fully unused".

**Improved**
- A mod's settings window said "Its menu is out of the game now" for a mod whose menu isn't in the game. It now says why, in a few words: "This mod is off", "Its menu is left out" or "All mods are off"; the tooltip explains that the app keeps those settings and puts them back when the menu is in the game again.
- Looks made consistent across windows: a mod's settings window puts Save and Cancel in the same order as Settings, Install and Edit; the Legacy Script Merger card in Settings folds with the same arrow as the Install window's cards; two error notes used a slightly different red from the rest of the app.
- The same file packed byte for byte the same in two mods' bundles (same size and checksum in their tables) isn't listed as a clash anymore: whichever is used, the game gets the same file. Mods whose only shared files are such copies no longer get a priority number for them.
- The mod list's grid lines are a little fainter, so they stand out less.
- In every clash tooltip the mod whose copy is used is blue and bold (it was white and bold), and the notes say "The blue one is used". Function names and kinds of file ("Textures 2/4", "Scenes"…) are white instead of blue, so the winner is the only blue name. In "Merged", every mod is blue and bold too, since all their changes are used.
- The ↑ update tooltip no longer ends with "Right-click → Open Nexus page. Version names don't always match, so check first."
- Code in Script decisions and in a merged file has nothing painted behind changed lines anymore, and no recoloured characters: both made it hard to read. A changed line's number is gold, and its code keeps its usual colours.
- A section that holds a mod you just installed gets a bronze edge on the left, so you can see where it went. It goes once you select that mod again (it's selected right after the install; that doesn't count), or after 30 minutes. Updates don't count as new.
- Status chips show just their icon; the count is in each tooltip section's title after a middle dot ("Clashes · 9", "Merged · 3", "Added · 7"). Settings → Mod list → "Show counts on status chips" brings the numbers back on the chips.
- The chip for functions and variables two mods' scripts both claim is ƒ instead of @.
- The settings chip (what a mod adds to your settings files: keybinds, settings lines, input.xml, keybind presets) is ≡ instead of ⚙.
- Settings → Detect Steam install also finds Snap installs of Steam, and a game's Proton prefix left in another Steam library after the game was moved.
- "Log in with Nexus" now uses OAuth 2.0 with PKCE, the login Nexus requires for mod managers.
- Requests to Nexus name your system as well as the app, as the Nexus API asks.
- Every mod's priority is its own: a typed number or a click in a clash tooltip no longer moves the other files from its Nexus page along.
- The keybind clash tooltip says which mod kept each key.
- Right-click a download → "Open in Downloads folder" opens your file manager with that mod's file selected.
- In the Clashes tooltip each kind of file shows how many clash out of how many that mod has ("Textures 3/10").
- A word after a version number ("3.1.0-lod", "2.0 Final") is no longer read as part of it.
- Tooltips can grow past the app's window, staying well clear of the monitor's edges: 12% of its height at the top and bottom, and now 12% of its width at the left and right too, the same on any monitor.
- A tooltip too tall for the screen gets wider before it scrolls, and a long list of files opened in one (Textures 130) goes into two or three columns.
- Simple tooltips (a folded group's numbers, a button's note) no longer break a line with a word or two left over: each line stays whole when it fits, and a long text fills the full width before it wraps.
- "Check Nexus for updates" first asks Nexus which mods changed lately (one request), then asks only about those. An update uploaded since your last check always shows, even minutes later; before, pages checked in the last 6 hours weren't asked again, so a fresh update could be missed. It also takes far fewer requests.
- Tooltips and hints all over the app are shorter and plainer, and none names a fixed place in the game's menus.
- After an update check the status line says how many updates it found ("Checked 117 · 3 updates"), with each one in its tooltip.
- Error windows can be resized: drag an edge or the corner and the details (the traceback) grow with it.
- Script Merger (legacy) is drawn at your screen's scale instead of tiny: while it runs, the game's prefix gets the DPI of the screen the app is on (150% → 144), and its own value goes back when Script Merger closes (or at the next start, if the app closed first). On a 100% screen nothing is changed. It also won't start while the game is running. The prefix's own value is read from its user.reg, so the only added wait is one quick Wine call, and the mod list isn't redrawn on the way.
- Starting Script Merger (legacy) again right after closing it failed with an error: its window was gone, but Wine was still closing behind it. Now the app waits until Wine has closed ("Script Merger closing…"), and only then can it be started again.
- A .7z or .rar made on Windows with backslashes for folders (`bin\x64_dx12\...`) installs into the right folders, as zips already did.
- A precompiled mod replacing a function that a loose script also changes or wraps is no longer red ("Won't work together"): it's an amber ƒ, "Script blobs", on the loose mod, naming whose version the game uses. Priority can't change it, so neither gets a number for it.
- A precompiled mod's wrapper of a function another precompiled mod replaces gets a priority, and an amber ƒ "Add-on skipped" while the replacement ranks higher.
- One ƒ chip per mod for every function or variable more than one mod's scripts claim: red when one of them can't work at all, amber when only one version is used. Its tooltip is laid out like file clashes: the mods (with their priorities only under "Add-on skipped", the one case where priority decides), the one the game uses in blue and bold, the others grey, then a little apart each function in white with the loose script file that loses under it. Functions the same mods claim share one group.

**Fixed**
- A mod's settings window shows the values the mod's own scripts set (Food Rebalance showed 0 everywhere until the game had run).
- Setting and preset names a mod gives through its scripts (Food Rebalance showed "Fr food hp" and the like).
- The "Also remove?" window on uninstall no longer stretches far too wide when several mods might have made a file.
- A mod's settings window kept the last setting's description in its card after the pointer moved off the settings. It now goes back to the page's own text (or blank) once the pointer leaves them; moving straight on to another setting shows that one's, and moving down onto the card to read it keeps it.
- The dividers between settings in a mod's settings window came out one or two pixels thick on a scaled display (125 %, 150 %), depending on where each fell. They're now drawn one screen pixel thick wherever they fall, a touch quieter (15 % see-through), and a sub-setting's tree line runs through them without a seam.
- A mod's menu setting the game shows only while a script turns its condition on still showed in the app when that script turns it off: Rational UI's "Add Tawny Owl formula" with Brothers In Arms installed (it adds the formula itself). The app now follows such a script when it decides by whether a DLC is installed, finding each DLC by the name its folder declares (Brothers In Arms' dlcbrothersinarms folder holds dlcbia). The setting is left out while hidden, its value kept, and a page left with nothing to show goes too. A condition switched any other way leaves the setting shown.
- In a mod's settings window, a small dark square showed where a setting's gold dot goes, on the hovered row. The row now paints its dot itself, with nothing else in that spot, so the hover colour covers it evenly.
- A mod's menu setting marked visibilityCondition="hideAlways" showed in the app though the game never shows it: Enhanced Camera's EnhancedCameraInit and EnhancedCameraVersion appeared as a third page. Such settings are left out of the settings window (their values are kept as they are), and a page holding only those doesn't count when a mod's only page opens directly.
- Mod settings changed in the app while all mods were off didn't stick: once the game had run without the mods, the window showed the menu's defaults instead of the values kept for it, and a value saved then was replaced by the older one when the mods came back. Both now use the values kept while all mods are off, and a value saved meanwhile is the one that comes back. Values an older version kept for a mod by mistake (saved while all mods were off) are cleared at the next sync.
- 4.x: saving mod settings writes both settings files, and the one the game hadn't written last could become the newer, so the app then read your settings from the other build's file. The file the game wrote last stays the newer one.
- A section the app adds to a settings file (a mod setting's, or a line from a mod's instructions) got a blank line before it even in the game's own files, which have none. It now follows the file's own style.
- A mod's strings saved with the 4.x version number but 5.00's one-byte text (No Artificial Player Light's) were taken as unreadable: its menu showed raw key names ("Gameplay light radius0", "Napl vanilla"). A strings file is now read by what its text is, not the number; 5.00 reads such files like its own, so they no longer count as made for 4.x either.
- A mod menu's setting that names its own section (overrideGroup on the setting) was read and saved in its page's section instead: the settings window showed No Artificial Player Light's settings off where the game had them on. They're read and saved in their own section ([NoArtificialPlayerLight]), and kept there while the mod is switched off.
- A group in a mod's menu with nothing to show was listed as a page of its own, so No Artificial Player Light's page showed twice.
- Reading a mod's strings (.w3strings) is about four times faster: it matters for mods with many languages, like Brothers In Arms.
- Starting the app got slower again: every sync saved the app's own list three times even when nothing had changed, each save waiting for the disk (up to a fifth of a second each on some file systems). A save that would write the same again is now skipped; anything that changed is still saved at once, with the copy of the save before it.
- The priority pill and the file icons in tooltips looked pixelated at 150% scaling: they were drawn at twice their size and shrunk to fit. They're now drawn at exactly the screen's scaling, pixel for pixel, and the other mods' priority numbers are plain text, sharp at any scaling.
- Priority numbers in tooltips (clashes, script blobs, add-ons skipped): only the number of the mod whose copy is used (the blue one) keeps a background, a tighter, fainter pill, its number at the text's own size; the others' numbers are plain, at the same size and place, so they still line up. Less clutter, and the winner stands out.
- In the settings chip's "Added" tooltip, a little space between the file's name ("user.settings · dx12user.settings") and its [Section] and lines.
- A selected row in the Install and Edit windows' folder trees (and the uninstall window's list) had a solid bronze block on its left, where the row is indented. It's now the same faint bronze as the rest of the row.
- No update showed for a file whose name carries its version (Night Sky: "NightSky 2.0.3" installed, "NightSky 2.0.4" on Nexus): each upload's name differed only by its version, so the app took them for different files. A file's own version is now left out of its name when telling which file is which; "DX12", "4K" or a game version in brackets ("Main files (5.0)") stay part of it.
- No update showed when an author archived your file and uploaded the new version as a new file, with nothing on Nexus saying one replaced the other (Reduce Frequency Or Remove New Idle Animations: "ReduceWipeAnimFreq" 1 archived, "CustomAnimWeight" 2 the main file now). When your main file is no longer offered and the page has one main file uploaded after it, that's its update: the ↑ shows, its tooltip says "Your file is no longer on Nexus. This is the mod's main file now.", and updating replaces your mod, even when the new version's folder has another name. Never a guess between two main files, never for an optional file, and never when it isn't known when yours was uploaded. An update worked out like this, from what an earlier check fetched, says its changelog comes with the next update check instead of showing none.
- ReShade's settings didn't stick (RenoDX): the app merged ReShade.ini with the copy already in the game folder and kept what ReShade saved as your edits. ReShade writes its .ini back whole and turns a key that's there twice into one list, so the values doubled with every save ("1,1,1,1,1,1,1,1") and ReShade fell back on its defaults. ReShade.ini is no longer merged: the mod's copy is placed, the one that was there is set aside, and what ReShade saves goes into the mod's copy as it saved it. An .ini next to the game's exe is merged only when two or more mods ship it, never with a copy that was already there (that copy is the tool's, not the game's). The doubled values an older version kept are dropped.
- Switching a mod off and on again lost two of your settings: the values you'd set in its menu in the game (the game drops them while it runs without the mod), and a key you'd rebound for it, which came back on the mod's own key. Both are now kept while the mod is off and come back when it's on, each where it was. This holds for every switch: a tick, a group, Turn all mods off. An update made while a mod is off keeps them too. Switched on while the game runs and off again before they could go back, they're still kept.
- A tooltip's scrollbar (a long changelog, a long list of clashes) had no visible handle, only a faint track: the list's own scrollbar margin squeezed it to a sliver narrower than its rounding, and nothing got drawn. It's drawn again, a little wider than before (8 px), on a faint track.
- Updating a mod could remove its add-on too (Music Plus and Music Plus - Music Pack): when an add-on from another file on the same page shares the mod's folder, the update offered to replace both. Now only the mod is replaced and the add-on stays as it is, with nothing more asked. A file Nexus records as replacing two others (Music Plus's "All in One") no longer makes those two count as versions of each other; installing the All in One itself still replaces both, since it has both in it.
- Starting took about a second longer since "Won't compile" came in: the game's own scripts (about 1,500 files) were read on every start, and read twice, once more for Script blobs. They're read once now and kept in scans.json until a game patch changes one of them, and a mod's scripts are kept the same way.
- Reading the first bytes of a file packed in a bundle as LZ4 (to tell its text encoding) could come back with the wrong bytes when the file starts with a long stretch the packer couldn't shrink. It unpacks the file instead now.
- A damaged or cut-off bundle could stop a merge or the clash list with an error (zlib's own, or a read past the end). It's taken as a file that can't be read, like any other damaged file.
- A folded kind of file in a tooltip ("Textures 3/607") could open showing another mod's total ("3/5"): when two mods' tooltips list the same files, opening one swapped in the other's line. Each opens to its own now.
- An update's changelog could be missing from its ↑ tooltip for good (Brothers In Arms 4.1.1, among others): when it couldn't be fetched as the update was found (Nexus busy, the hourly allowance short), later checks skipped it for as long as the mod's page didn't change. Every check now fetches the changelogs still missing.
- Selecting code in Script decisions was unreliable: pressing inside what was selected (a block picked out with a double-click, say) didn't start a new selection, since Qt took it for dragging that text away, so nothing got selected. Every press starts a new one now. Double-clicking a brace also no longer scrolls the view to the block's other end.
- Scrollbars were hard to grab: only the middle of the bar caught the mouse. The whole width does now, though they look as thin as before.
- Opening the ••• menu asked Nexus for your request allowance.
- A mod that ships an unchanged copy of a game script or XML was listed as merged with the mods that changed it.
- Dragging a main mod also moved the priority of its linked files (patches, optional files); now they move with it in the list but keep their own priority.
- A mod whose author changed how he numbers ("1.41", then "1.4.5") offered a Downgrade for the newer file, and could show ↑ for the older one.
- The note on "Merged Free DLC - Mod Limit FIX" said the Remastered had removed the mod limit. What's known is that it merged the game's DLC into one bundle, so the note says only that.
- An update you already have could show up ("1.0.4 → 1.0.4 (uploaded again)"): when an author uploaded a page's variants one after another and Nexus recorded each as replacing the one before (a MAIN file "replaced" by an OPTIONAL one, both still offered), or when the app took your file for an older upload of the same version.
- A mod whose file the author has since deleted from its Nexus page showed no update, however new the page's version (Brothers In Arms - Ultimate Edition 4.0.4 with 4.1.1 on Nexus): the app took the newest file of the same name for yours. Now your own file stands in for it (its file id, your version, its upload time), Nexus's record of which file replaced which is followed past the deleted ones, and the update shows. It shows as soon as the app starts: what the last check brought is enough.
- "Reinstall from archive" made the mod forget which Nexus file it came from, and installing from a card for your own archive gave it a file id made up from the archive's name.
- Clicking a download's trash icon (or anything else that takes a card away) could make the Downloads list jump to somewhere in the middle. It stays where it was now.
- Settings could all reset on the next game start, with the first-launch screens back (reported with "Immersive Gear - Upgrade Kits - Hardcore"): the app read a report file the mod writes itself (upgradekitslog.ini, with a [DLC] header) as lines to add, and put about 100 of them in the game's own [DLC] section of dx12user.settings. One of them had a value the game can't read, and the game then threw the whole file away. Those lines go back out by themselves.
- When Nexus stopped answering halfway through the update check, it ended in an error window with a traceback ("The read operation timed out"). Now the check stops there, keeps what it found, and the status line says so ("Nexus stopped answering, 77 left").
- The "Not added" tooltip pointed at a right-click item that no longer exists. It says Edit… now.
- A tooltip jumped wider (and its text re-wrapped) when its scrollbar appeared, and could jump back up over its own chip when the scrollbar went away. Tooltips now always keep the scrollbar's room, and only draw the scrollbar when there's something to scroll.
- A mod other mods build on (Shared Utils, say) could end up loading before them, and the game's scripts wouldn't compile ("Unknown base class"). The app now finds which mods use another mod's classes and always keeps the one they need below them in priority.
- An archive with nothing but settings files (input.settings, user.settings, dx12user.settings) was installed as a mod folder in mods/, where the game ignores it. Now nothing goes into the game folder.
- "Move file to Trash" on a download on a second drive (your game drive, say) seemed to delete it for good: it went to a Trash folder on that drive your file manager's Trash didn't show.
- The update check counted Nexus pages, not mods: with an optional file or a patch from the same page as its main mod, "Checked 115" for 122 mods. It counts the mods on your list now, and "N without Nexus ID" makes up the rest.

### Details

**Names and values from a mod's scripts**
- Some mods name their settings in their scripts instead of in a strings file. Food Rebalance changes the game's own `inGameMenu_TryLocalize` function to give each setting and preset its name, in every language. A mod's settings window now runs that function as the game would, for the mod's own version and for those of other mods that are on. A name the function doesn't answer comes from the strings as before. Page names still come from the strings, as in the game.
- Some mods also give no starting values in their menu file: their scripts write the values when the game starts or the menu opens, so until then the settings file has none. The window now shows the value the mod's scripts write there, but only when every write to that setting gives the same value, the value fits the control, and the key of every write in the mod's scripts can be worked out. Otherwise it shows what it did before. A value already in the settings file, or given in the menu file, always wins. Opening the window still counts nothing as changed, and Save writes only what you change.
- The script reader now also follows the game's text language (`GetGameLanguageName`), `StrFindFirst`, `StrAfterFirst` and similar string functions, number comparisons, and loops that count from one number to another. Descriptions written the same way are found too.

**Seeing a merged file**
- The whole file, nothing folded away. Line numbers are the merged file's own, so they match what the game's compile errors point at. XML files that are merged open the same way.
- Each change is named after the mod whose own copy makes it. Where you picked one mod's version over another's, only the one used is named. One mod's edits a few lines apart count as one change.
- A file with decisions of yours has a Script decisions… button: it closes this window and opens them on that file. A file merged on its own has only Close.
- The code font and size are at the bottom left. They're the ones from Settings: a change there is saved at once and used in Script decisions too. The line in the middle of the view stays there while the text grows or shrinks.
- The scrollbar has a small gold mark where each change is in the file. Click one to jump to it.
- Hover the file's name at the top to see the game's original in its place, at the same spot: the code in the middle of the view stays where it is on screen. The lines the merge changed or took out have gold numbers there. Move away and the merged file is back, exactly where it was. Both are ready when the window opens, so the swap is instant (a 12,000-line script takes about two seconds to open).
- As in Script decisions, click beside a { or } to see that block, or select some code: what you picked out shows in full colour, the rest greyed out. Copying leaves the line numbers out.

**Settings lines from a mod's files**
- A config file (.ini, .cfg) inside a mod's own folder (mods/<name>, dlc/<name>), or named as a log, isn't taken as instructions: it's the mod's own file, and it may write to it while the game runs. It gets its own grey row in Optional parts ("102 values, from upgradekitslog.ini"), unticked. Tick it, in the Install or Edit window, to add its values anyway; untick takes them back out. An update keeps your choice. Readmes are read as before.
- A line whose value has a `:` in it is never added, wherever it would go. The game cuts a value at `:`, and such a line with more lines after it made the game throw the whole file away (tested in game: the same line alone, or the other 101 lines alone, were fine; in a section of its own it still reset). The mod's ≡ tooltip lists what was left out.
- A note after a `;` in a readme's line ("Speed=2 ; default is 1") is the readme's comment: it's cut off, and the line goes in as "Speed=2".
- Every mod's instructions are read again once with this version, and lines added before that no longer belong are taken back out, leaving the settings files as they were.

**Keys from a mod's script**
- The app reads .bat, .cmd and .ps1 files in a mod's archive for the keys they add: lines echoed into input.settings ("echo IK_F9=(Action=…)>>…input.settings"), or keybind lines and the contexts they go in, written out in the script (Music Plus: F3, F4 and two gamepad holds, in twelve contexts). Key Bindings menu entries (<Var builder="Input" …/>) go into input.xml, as from a readme.
- A script named as an uninstaller isn't read for keys: it takes them out.
- What the script does besides (backups, checks, an uninstaller, a playlist editor) isn't run: the app does the installing and uninstalling. A key that already does something else in a context is still added and flagged, as for any mod's keys.
- Mods installed before this version: reinstall them (right-click → Reinstall from archive) for their scripts to be kept and read.

**Leaving out a mod's menu**
- A mod's own menu is an XML file of its own in bin/config/r4game/user_config_matrix/pc. Its copy of one of the game's menus there (gameplay.xml, say) changes a menu the game has, so it isn't offered: it goes in with the rest of the mod.
- Unticked, only that file stays out of the game (and on 4.x its line in the dx11/dx12 filelists). Ticked again, it comes back. Nothing else in the game or your settings files changes either way.
- The game forgets a menu's values when it runs without that menu, so the app keeps what the menu had in user.settings and dx12user.settings when you untick it, and puts back whatever the game dropped when you tick it again, each line where it was. Lines still there are left as they are.
- The menu sign in the list says so in its tooltip while the menu is left out.
- Without its menu a mod runs with its own defaults; some mods do nothing without it.

**Files a mod's tools left behind**
- Only a mod's own folder counts (mods/<name> or dlc/<name>), only one the app made, and only once no mod staying installed uses it. Files in the game's own folders, in a folder you had before, or in mods you put in yourself are never listed.
- Up to 20 files are listed in the question, by folder; a longer list is under Show Details. Removed files go to the Trash, and the mod's folders go once they're empty.
- A file another installed mod might have made shows a short note, "Maybe another mod's"; its tooltip, "Maybe a different mod created it", lists every one of those mods below it, one per line. A file known only by when it was made says so in its tooltip. A window size saved while the old long notes stretched it is not brought back.

**Checking for updates**
- This is how the check works once you're logged in to Nexus. Without a login, see Update checks without a login, below.
- Nexus keeps lists of the mods updated in the last day, week and month, each with when it was last updated. The check asks for the shortest one that reaches back to your oldest check, and asks about a page again when it's on that list with an update after its last check. A page not on it hasn't changed and counts as checked now.
- A page never checked, or last checked more than 4 weeks ago (further than the month list reaches), is asked about anyway. One updated up to 15 minutes before its last check is asked again too, in case the list was a few minutes behind or your clock is off.
- Without the list (an error on Nexus's side), pages checked in the last hour wait (it was 6 hours), so a Nexus having trouble isn't asked about every page at once. Right-click → "Check for update" still asks about that mod's page straight away.
- The status line says how many it checked; its tooltip, how many changed and were asked about, and how many hadn't.
- A changelog answer from Nexus in a shape the app doesn't expect is skipped instead of stopping the check.

**When Nexus doesn't answer**
- Every call to Nexus waits 20 seconds for an answer, as before. One that doesn't come, or stops coming halfway (the connection drops), is asked once more after 2 seconds; when that fails too, the app says "Nexus didn't answer in time." or "The connection to Nexus dropped." instead of a traceback. Downloads and the login already did.
- The update check stops at the first page Nexus doesn't answer for, so a dead connection doesn't cost 20 seconds per mod. Pages checked before it keep what they got (and are saved); the page it stopped on keeps what it had. It isn't counted as a finished check, so the next one picks up the rest.
- An error on Nexus's side for one page's files list (other than "not found") no longer wipes the list from the last check: until the next check that works, that page's files are the ones it already knew.

**Groups**
- Right-click with two or more mods selected → "Group N mods". They gather where the topmost of them is, in its section (any from other sections move there). Priority doesn't change.
- A mod from a Nexus group brings its whole group along, as ordinary members: no groups inside groups.
- With a main mod: it's on top, the others indented under it with tree lines. Switching it off switches the group off (and back on), dragging it moves the whole group. Right-click → "Set as main mod", or "Main mod of its group" in the Edit window (was "Main mod of its Nexus group"), which can now be unticked too.
- Without a main mod: a header row on top instead, a row like a mod's with its name in bold, the mods indented under it with the same tree lines. It's named after what the mods' names start with ("4K Reworked Women" for "4K Reworked Women - Shani", "- Triss"…), or "Group"; double-click the name (or right-click → Rename) to change it, and an empty name brings the worked-out one back.
- The header's checkbox switches all its mods on or off, and shows a dash when only some are on. Each mod still switches on its own. On the right it counts how many are on ("3/4").
- Click the arrow after the header's name to fold the group into its one row. Folded, its priority spot shows the numbers of the mods inside: "3–6" when they run in a row, "3 +2" when they don't (the lowest, and how many more), with each mod's number in the tooltip. The header has no number of its own: priority stays the mods'. Folding is remembered.
- Dragging the header moves the whole group, like a section: the mods take their priority from where they land, as a block. A folded group is dragged whole too. A mod dropped right under the header joins the group; right above it, it stays out.
- While the filter is on, headers step aside like sections.
- Dragging: a mod dropped between two mods of a group joins it, and a whole group dropped there joins it as ordinary members. Dragged away, a mod leaves its group. Dropped right above or below its own group it stays in, except above the main mod, which always stays on top. Dropping a mod right under a group's last mod doesn't put it in.
- Right-click a mod → "Ungroup" takes only that mod out (or the ones selected, "Ungroup N mods"), right under its group; the rest stays a group. On a group's header, "Ungroup all" ends the whole group and leaves every mod where it is.
- Files from one Nexus page are still grouped on their own: a new file joins its page's main mod's group, at the end. An update stays in its group, in its place. Moving a main mod to another section in the Edit window takes its group along; moving any other mod of a group takes it out.
- Uninstalling a main mod leaves the rest as a group without a main mod (they used to be unlinked). Installing that page's main file again makes it their main mod again.
- A new mod never lands between two mods of a group, and "New section above" on a mod inside a group puts the section above the whole group.
- Groups from older versions become groups like these on the first start, with the main mod moved to the top (a patch listed above its main mod goes under it). Only the list order changes, never priority.

**Precompiled scripts**
- What a precompiled.rsblob declares is read as before, and now also what it wraps (@wrapMethod) and each class's parent. Loose scripts are read for @wrapMethod too.
- A function one precompiled mod replaces or adds that loose scripts also change (a copy of the game script), add or wrap: the precompiled one is used whatever the priority (CDPR's REDkit notes; Script Merger - Remastered warns that priority can't fix it). The loose mod gets an amber ƒ, "Script blobs", with the function and whose version is used. Nothing in it breaks: only that one function of the loose mod doesn't take effect. A mod's own loose source next to its own blob doesn't count.
- A precompiled mod can also declare one of the game's own classes again with its own functions (Deaths Reworked does it with W3DamageManagerProcessor, 54 functions; Better Buffs with two effect classes). Each of those functions takes the game's place, so it counts like a replacement: a loose copy of that game script that changes one of them gets "Script blobs". Two precompiled mods declaring the same class again aren't flagged: what the game does then isn't documented.
- A function one precompiled mod replaces and another precompiled mod wraps: the wrapper is skipped while the replacement has the higher priority (Script Merger - Remastered's findings). Both get a number, and the wrapper gets an amber ƒ, "Add-on skipped", until it ranks higher.
- Still red: two mods adding the same function or variable, or two precompiled mods replacing the same one. Tested in game (23 Oct) with two loose mods adding the same method: the game stops at a script compilation error, "Function 'CR4Player::W3MM_Test' is already defined and 'canRedefine' is false.", and doesn't start. The red tooltip says so: "The game won't start with both: its scripts don't compile." Two precompiled mods replacing the same function haven't been tried in game, and their line says so.
- All of these share one ƒ chip on the mod: red if any of its cases can't work at all, amber otherwise, with a section for each kind in its tooltip.

**Keybind presets**
- An archive holding only the game's settings files (readmes and pictures aside) is a preset: nothing goes into the game folder, and the mod's name tooltip says "Nothing in the game folder".
- With an input.settings, it's a keybind preset. Its file is kept with the mod's readmes. Each section it has replaces yours as a whole (binds aren't one line per key, so mixing two layouts line by line would make a mess); sections it doesn't have stay yours, and one you don't have is added. Your blank lines after a section stay as they were.
- Switched off (in Edit, or Turn all mods off), removed, or updated: each of your sections comes back exactly as it was, unless it changed since (you rebound a key in the game), and then yours stays. Unchanged, the file is byte for byte as before. Keybind lines the app adds for other mods are added on top and never count as a change.
- Two presets: the one higher in priority is used; the other's ≡ tooltip says so.
- Only user.settings or dx12user.settings: read like a readme's lines, as before (only what you don't have is added).
- Checked on the real "(REMASTERED) Alternate controller layout" file: 48 sections, about 3,000 lines.

**Mods that need another mod's classes**
- The game compiles scripts in reverse load order, and mods with a number in mods.settings load before those without (W3ModWorkbench; the same failure was reported against another Linux mod manager). So the mod others build on has to rank below them, or their classes meet a parent that doesn't exist yet and the scripts don't compile.
- A class (or a state's class) defined in a mod's precompiled scripts or its own loose scripts on top of a class only one other mod defines, and the game doesn't, makes that other mod a dependency. Copies of the game's own scripts don't count, nor does a class several mods carry.
- The dependency is kept below the mods that need it: put above them by hand, it goes back below at the next sync. When neither needs a number, name order already decides (unnumbered folders load in name order), so they get numbers only when that order is wrong, or when the dependency gets a number for a clash.
- The priority tooltip says it: "Kept below Brothers In Arms, which needs it." and "Kept above Shared Utils, which it needs."

**Priority**
- A patch or optional file from the same Nexus page as a mod used to move as one block with it: typing a number moved them all, and clicking one in a clash tooltip moved its main mod too. Now each mod moves on its own, like any other mod: a typed number moves only that row, a click trades numbers between just the two mods, and the others keep theirs.
- In the list they still sit together: a new file from a page goes right under that page's main mod, and moving the main mod to another section takes its files along. That's only where they're listed, never their priority.

**The new name**
- "W3 Linux Mod Manager" in the window title, messages, notifications and the login page, and `w3-linux-mod-manager` in what the app sends to Nexus. File names stay the same (`w3modmanager.py`, `w3modmanager.sh`, `_ModManager`, `shortcut_w3lmm.sh`), so updating works as before: a shortcut made by an older version is still found, and it's brought up to the new name on the next start.

**.ini merging**
- Any `.ini` in `bin/` that a mod ships and the game has too, or that two or more mods ship, is merged instead of replaced. The starting point is the game's file as it is, with your own values in it. Each mod brings only what it changes: keys whose value differs from the game's, and keys and sections the game's file doesn't have. A key a mod leaves out stays as it is.
- Two mods setting the same key differently: the higher one's value is used, and the merge's tooltip names the key ("Set by more than one, the higher one's used: [Rendering] Shadows").
- The game's own lines keep their place, comments, spacing and encoding (UTF-16 stays UTF-16). A changed value is edited in place, a new key goes at the end of its section, a new section at the end.
- Keys you edit in the placed file afterwards (in place, or saved as a new file by an editor) are kept as yours: they win over every mod's and survive later merges. When the last mod goes, they stay in the game's own file; without edits, the game's file comes back byte for byte.
- A mod that ships a whole copy of a game `.ini` sets every value in it that differs from yours, so a value you had changed by hand and the mod's copy has differently goes to the mod's while it's on, and comes back when it goes.
- Mods already installed get this on the first start: a game `.ini` one of them replaced is merged instead.

**Bundle count**
- The number of `.bundle` files the game loads from mods, as a plain number. No limit for it is published, so there's no warning either.
- A mod that loads far more bundles than most has its number in a brick red in the tooltip (the name stays as it is), for information only: at least three times what the middle of the list has (the median, so the big one doesn't shift it) and at least 5, with five mods or more. The note says what most have ("which have 1 to 2").
- Counted from the game folder: the `.bundle` files in each `mods/<folder>/content` and in the mods' own `dlc` folders, including the app's merge bundle and mods it didn't install. Mods that are off and the game's own DLC don't count. The tooltip lists each mod with its number, in priority order. Hidden when there are none.

**Open in Downloads folder**
- The downloads panel's right-click entry (was "Open downloads folder") asks your file manager to show the file selected, through the request Dolphin, Files, Nemo, Thunar and the others answer (freedesktop FileManager1). A whole mod's card selects all its files. When no file manager answers, or the file is gone, the folder opens as before. The panel's own "Open folder" button still just opens the folder.

**Detect Steam install**
- It reads Steam's list of libraries from native, Flatpak and now Snap installs of Steam, and finds the game in any of them. Steam keeps a game's Proton prefix in the library it's installed in (`steamapps/compatdata/292030/pfx`), and that's still where it looks first. When there's none there (a game moved to another library can leave it behind), it looks in the other libraries too and takes the one holding the game's settings, written last; the Settings window then says the prefix is in another Steam library, with its place in the tooltip. Two installs of the game: the one with a prefix of its own goes first. No prefix anywhere: it says so, as before.

**The icon**
- A leather book with the wolf medallion and a scroll sealed with Tux. It's built into the app (six sizes, 16 to 128 px, about 76 KB), so it's still one file to copy. On the taskbar and in Alt+Tab it has a grey outline, which keeps it clear on a dark taskbar as well as a light one; in title bars, where it's tiny, it's drawn without the outline, which looked pixelated that small, with a size made for a title bar at 125% (20 px) and clean edges (no bright specks round the book). Every window of the app uses it, on KDE with Wayland too: taskbar and Alt+Tab included, without a menu entry.

**Changelogs**
- Fetched during the update check, only for a mod page with an update waiting: one request more for that page, none for the others. Not fetched again until Nexus has a newer update than the one it was fetched for, and never for an update you chose to ignore. Nothing is fetched when you hover, or when the app starts; the tooltip shows what was saved, offline too.
- The tooltip lists each version after yours up to Nexus's, with the author's lines under it. The author's formatting (bold, colours, links, HTML) is taken out, and a line that wraps stays under its dot.
- A changelog belongs to the whole page, not one file, so for an optional file or a patch the lines may be about the main file. Versions the app can't place (a name without a number, like "Beta") are left out. An author who changed how he numbers ("1.41", then "1.4.5") gets the entry for Nexus's version. No entries for those versions: the tooltip says so, in grey. Mods checked before this version show no changelog part until their next update check.

**Which Nexus file is yours**
- The update check has to know which upload on a mod's Nexus page you installed. It now goes by, in this order: the archive's own Nexus name (it ends in the upload time, so it fits one upload only, and it's the file that was actually installed); the file id kept from a download through the app; the archive's size, to the byte, which Nexus sends with its file list (kept now, it used to be thrown away). Only then by the file's name and version, and if two uploads of that version are still alike, the newest: never an older one, which is what showed an update you already had.
- Once it's known for sure (by the Nexus name or the size), the file id is saved with the mod, so later checks go by the id like a download through the app. A wrong or outdated id is corrected. This happens on start, from pages already checked (nothing is sent to Nexus), and after each update check.
- Nexus's record of which file replaced which is only followed where it's a real replacement: the old file was moved to Old versions or Archived (or is gone), or both files have the same name. An author who uploads a MAIN file and then two OPTIONAL variants as "updates" of each other, all still offered, gets three separate files, not a chain of versions. That record also decides whether a download is a new version of a mod you have, so a variant is no longer offered as a replacement for it either.
- A version uploaded again (Nexus records the new upload replacing the old) at the same size is the same file, so it isn't an update. At another size it still is, "(uploaded again)".
- A reinstall from the mod's archive keeps its file id. A card for an archive from your own files has no Nexus file id, and none is made up any more.

**Move to Trash**
- The jump: the clicked button had the keyboard focus, and when its card went Qt handed the focus to the next widget in the order the cards were made (not the order they're listed in) and scrolled there. The focus now goes to the list itself first, and the scroll position is kept.
- Files are now put in the Trash the way your file manager does it: through KIO on KDE (`kioclient`), through GIO elsewhere (`gio trash`), so they show in the Trash and can be restored from there, whichever drive they're on. Qt's own way, used before, is now only the last resort. It made a `.Trash-1000` folder at the top of the second drive, which Dolphin's Trash may not list. The same goes for the old archives cleared out after an update.
- Files trashed by an older version on a second drive are most likely still in `.Trash-1000/files` at the top of that drive.

**Downloading a file you already have**
- Same Nexus file, still downloading: nothing is started twice. Already downloaded: nothing is fetched, and the Install window opens as usual (not when it's the exact file you have installed). Either way its card is scrolled into view and its border flashes three times, and the status line says "Already downloading" or "Already downloaded" (with "(installed)" when it is), with the file's name in the tooltip.
- A card you removed whose archive is still in the downloads folder: Nexus is asked about the file, but it isn't downloaded again.
- An archive that already had a card from your own files gets one card, the Nexus one, instead of two.

**Merge listings**
- A copy identical to the game's own file (also with spaces for tabs, or trailing spaces or blank lines) adds nothing to a merge, so it's no longer named in the other mods' merge tooltips and gets no merge chip itself. When only one mod's real changes are left, no mod shows a merge chip for that file. The merge itself is unchanged.
- Merges made by an older version are worked out again once, on the first start, so the fix reaches them too.

**Linked files and priority**
- Every mod's priority is its own, linked or not. Typing a number already moved only that mod; now dragging a main mod does too: its linked files still come along in the list, but each keeps its place in the priority order, and only the main mod takes its priority from where it was dropped. Dragging a linked file yourself moves its priority like any mod's.
- Unchanged: a patch or optional file installed for a mod you have is still numbered right above its main mod when it changes that mod's files, so it works from the start.

**Versions of one Nexus file**
- Two files from the same Nexus page are put in order by their version numbers, except: when Nexus itself records one replacing the other, its upload order decides; and when an author changed how he numbers, from "1.41" to "1.4.5" (more parts in the later upload), the later upload is the newer one, though 41 is more than 4. The upload times come from Nexus's file list, or the download's own name.
- The same number uploaded again isn't an update unless Nexus records it replacing yours; then the update list and the ↑ tooltip say "(uploaded again)". A later file with fewer parts ("1" after "1.4.2") isn't taken for a newer version either. A version for an older game uploaded later under the same name ("1.3.9" after "1.4.5") stays the older one.
- This is used everywhere a version is compared: the download cards (Update, Reinstall, Downgrade), the Install window, the replace question, the ↑ chip and "Ignore update", and which old archives go to the Trash after an update. Archives that aren't from Nexus go by their numbers, as before.

**Versions**
- The number is the version; a word after it names the file: "3.1.0-lod", "5.5.1-hotfix", "2.0 Final", "1.0.NG" and "1.0-rc2" are 3.1.0, 5.5.1, 2.0, 1.0 and 1.0. A letter glued to the number stays ("1.2b"), and a version that's only a word ("Final") is kept as it is.
- Versions saved by older versions are cleaned when the mod list is read, and an update you chose to ignore stays ignored.
- "1.0-rc2" was counted as newer than 1.0 (the 2 was read as a third number). Now they're the same.

**Archives with backslashes**
- The ZIP format asks for forward slashes between folders, but some Windows tools write backslashes, and many Linux and Steam Deck tools then put every file in the top folder. The app reads zips itself and always took both. For .7z and .rar, which go through 7-Zip, bsdtar or unrar, any file or folder name still holding a backslash after unpacking is now split into its folders (a Windows file name can't contain one, so each is a folder break). A name that would climb out of the folder (`..\..\`) is refused, as for zips. Listing an archive's files reads backslashes as folders too.

**Tooltips**
- Qt's own tooltips (the plain ones, not the clash and merge ones, which the app already sizes) picked a width of their own guessing for anything formatted, so "13  4K Reworked Women - Yennefer Curvy" could end up with "Curvy" on a line of its own. Now each line stays whole when the widest fits in 640 pixels (less on a small screen); past that the lines fill that width before they wrap. Still kept on the screen.
- A long tooltip used to stop at the app window's edges, so one opened near the bottom of the list came out small and scrolled. Now it grows past the window if needed, keeping 12% of the monitor's height clear at the top and bottom (and 12% of its width at the sides), and only scrolls when it's taller than that.
- A chip close to the monitor's top or bottom edge still gets its tooltip right beside it, so there's no gap to cross to reach it.
- On Wayland an app isn't told where its window is on the monitor, so the room is worked out from the window's middle. With the window maximised that's exact. With a smaller window near an edge, KDE moves a tooltip that would run off the monitor back onto it.
- A tooltip pushed up to fit sat one pixel past the bottom of its room.
- Wider before it scrolls: a tooltip keeps its reading width (about 64 characters) while it fits. One that would have to scroll gets wider first, but only when that really makes it shorter (its wrapped lines straighten out), just as wide as it takes, never past the screen's room, and only scrolls past that. What it's measured by is what it lists: its grey explanation lines wrap to that and never widen it. A list of one file per line isn't any shorter wider, so that's what columns are for.
- Columns: a kind of file opened in a clash or merge tooltip with 12 lines or more, too many to fit, goes into two columns, or three if two still don't fit and the screen is wide enough. They read down, then across, in the usual order, and the tooltip takes their width, never more than the screen. Folded again, it's one list as before. Lists with notes under their files stay one column.

**Clash counts**
- Each kind of file in a mod's Clashes tooltip shows its clashing files out of all the files of that kind the mod packs (in its bundles, `texture.cache` and `soundspc.cache`): "Textures 3/10" on a mod with 10 textures, 3 of them also in another mod. Each mod's tooltip counts its own files, so the other mod may say "3/8". Text clashes (one "Texts" line) keep their single count.

**Keybind clashes**
- Each clashing key gets its own line: "IK_F5 in Exploration · kept by Quick Loot" on the mod left out, "IK_F5 in Exploration · kept, also wanted by Friendly Meditation" on the one that has it. Changing their priority swaps them.

**Nexus login**
- Follows Nexus's own OAuth 2.0 guide for public apps. Settings opens Nexus's login page in your browser; once you allow the app there, Nexus sends your browser back to `http://127.0.0.1:28651/callback`, a small listener the app runs on your PC for the duration of the login only. The app then trades the one-time code for an access token and a refresh token, and checks the token's signature against Nexus's public key before using it.
- It switches on once the app's Nexus client ID is filled in (`NEXUS_CLIENT_ID`). Until then there's no login: update checks still work, Nexus downloads are off (see below).
- The access token is renewed by itself when it runs out, only when a request needs it (never at start). If Nexus refuses the renewal (you took the app's access back on Nexus), you're logged out and asked to log in again.
- The tokens are kept in the settings file, which only your user can read, and are only ever sent to Nexus. Log out in Settings deletes them.
- A personal API key pasted before the login existed is cleared once the login is set up, since Nexus doesn't allow personal keys in public apps. The app never asks anyone for a personal key: the old "get a key on Nexus" prompt and link are gone.

**Nexus API rules**
- Checked against Nexus's API acceptable use policy and the REST API's own description. Every request (update checks, downloads, the login) carries the same app name, the current app version, and a user agent naming the app, its version, your system and Python, for example `w3-linux-mod-manager/1.0 (Fedora Linux 43; Linux 6.17; x86_64) Python/3.14.0`.
- Nexus is only contacted when you do something that needs it: checking for updates, a "Mod Manager Download" or logging in. Opening the ••• menu used to ask for the allowance; now the footer shows what Nexus reported with your last check or download.
- A download from a "Mod Manager Download" link passes on the link's own key and expiry, as Nexus requires for accounts without Premium. The API key is only ever sent to Nexus's API, never to the file server.

**Update checks without a login**
- Nexus lets anyone read a mod page's versions, files and changelogs; only downloads need an app Nexus has registered. So the check works without an account, and no key is ever sent.
- It asks about all your mods at once (50 pages a request) and fetches files only for pages with something new. With 200 mods, a check with nothing new takes 4 requests.
- Results were compared with what a logged-in check gets on real mods: the same updates, the same changelogs, the same files found as renamed updates.
- At most 100 requests per check (about 900 mods). Past that it stops, says how many are left, and the next check starts with those.

**Downloads panel without a login**
- The panel and its footer button are always there. Without a login it says "Mods you install from your own files show here.", its tooltip says what turns Nexus downloads on, "Mod Manager Download" links aren't taken, and a failed Nexus download's Retry is off with the same tooltip.
- Everything else on the cards (install, the link to the mod list, deleting archives, update states) works as before.

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
