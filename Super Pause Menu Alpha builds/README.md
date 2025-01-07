Latest build not quite ready for full release. Could be buggy.

-Working on- (Priorities may changed or dropped)
1. Implementing CBZ and CBR support for manuals
2. Allowing the user to create submenus for their hotkeys
3. Video support
4. Guide book support
5. Managing Save state images
6. Artwork viewer


-Log-
Updated default emulator profile for mame for the default hotkeys for v 0.273. Ensure your command line paramaters for mame  are "-keyboardprovider dinput" inside of Launchbox. For attract-mode (and +) Command arguments in would be [name] -keyboardprovider dinput
Added a folder 
-Added a folder in \Super pause menu\Emulators for older emulator hotkey configs. Called "Older and alt emulator configs"
-Updated launchbox plugin from .netcore 3.1 to 6. Can now push game filepath to the pause menu
-Changed the pause/unpause button in mame to F5 to match the new mame default keys.
