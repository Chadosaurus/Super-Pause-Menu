Super Pause menu is a pause menu for windows that was specifically made for launchbox, a front end emulator launcher. https://forums.launchbox-app.com/topic/55355-chadmandos-super-pause-menu-64bit-windows/
In this version I have included some support for the attract mode front end emulator as well. Specifically I have tested this with the mame emulator.
To use this for attract mode, you need to extract the "Super Pause Menu" folder from the zip file into the main attract mode folder. Open the settings.exe in the "Super pause menu" folder to ensure you are happy with all your settings (use the above link to help guide you if needed), make sure the correct emulator.exe is chosen for the specific emulator you want it to work with.
You will need to modify your emulator.cfg config file located in your attract mode folder, eg: /ATTRACT MODE/emulators/mame.cfg
in the emulator config file you will need to change:
executable           C:\Users\user\Desktop\attract-v2.7.0-win64\Super pause menu\Super Pause Menu.exe <- Change this to the absolute path of where Super Pause Menu.exe resides
args                 "D:\Video Game Emulators\Arcade\mame0173_64kbit\mame64.exe|[name]|[system]|[Title]|Hide" <- Needs to be in this format including quotations "EMULATOR LOCATION|Emulator Arguments(ie, [name] for mame)|[system]|[Title]|Hide (to hide console, or leave this one blank if uneeded.)
rompath              E:\Video Game Roms\Arcade\ <-Directory where your emulator is located.
Everything else can be whatever it needs to be.
My mame.cfg looks like this:

executable           C:\Users\user\Desktop\attract-v2.7.0-win64\Super pause menu\Super Pause Menu.exe
args                 "D:\Video Game Emulators\Arcade\mame0173_64kbit\mame64.exe|[name]|[system]|[Title]|Hide"
workdir              D:\Video Game Emulators\Arcade\mame0173_64kbit
rompath              E:\Video Game Roms\Arcade\
romext               .zip;.7z
system               Arcade
info_source          listxml
artwork    marquee         $HOME/mame/marquee
artwork    snap            $HOME/mame/video;$HOME/mame/snap

Ensure the attract mode executable is not changed from attract.exe, or this will not work. Ensure that any pause key setting within the attract mode menu is disabled or it may conflict with the super pause menu.
I do not have the custom artwork working yet like in launchbox, but it is something I could look at in the future.
