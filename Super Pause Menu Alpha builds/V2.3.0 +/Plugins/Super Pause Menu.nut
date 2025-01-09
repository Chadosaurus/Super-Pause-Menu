class UserConfig </ help="Super Pause Menu Plugin - For more more customization settings, launch settings.exe in the Super pause menu folder" />
{
	</ label="Platform name", help="What information to use for the platform name? If DISPLAY NAME or EMULATOR NAME are chosen, they must match the plaform name in your attract mode settings. The SYSTEM TOKEN will not work properly if it has no value in your attract mode emulator settings, it also need to be set up for only one system ie, \"Nintendo Wii\", but \"Nintendo Wii;Nintendo Gamecube\" will not work properly",options="System token, Display name, Emulator name", order=1 />
	GamePlatform= "System token";
	</ label="Platform clear logo folder", help="Image files are chosen if the image filename matches the platform name. A value of \"Default\" will look for images in the Super pause menu\\Images\\Platform Clear Logos folder.", order=2 />
	PlatformClearLogo= "Default";
	</ label="Background image", help="Which artwork should be used to show for the BACKGROUND image (if enabled in settings.exe) (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=3 />
	BGImage = "fanart";
	</ label="Game clear logo", help="Which artwork should be used to show for GAME CLEAR LOGO (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=4 />
	ClearLogo = "wheel";
	</ label="Game front image", help="Which artwork should be used to show for BOX FRONT image (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=5 />
	FrontImage = "flyer";
	</ label="Game box back image", help="Which artwork should be used to show for BOX BACK image (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=6 />
	BoxBack = "BOXBACK";
	</ label="Game screenshot", help="Which artwork should be used to show for SCREENSHOT image (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=7 />
	ScreenShot = "snap";
        </ label="Game Cart/Disk 3D image", help="Artwork label used for CART/DISK 3D IMAGE (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=8 />
	CARTDISK3D = "CARTDISK3D";
        </ label="Game Cart/Disk 2D image", help="Artwork label used for CART/DISK 2D IMAGE (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=9 />
	CARTDISK2D = "CARTDISK2D";
        </ label="Game back of cartridge", help="Artwork label used for back of game cartridge (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=10 />
	CartBack = "CARTBACK";
        </ label="Game box 3D image", help="Artwork label used for the 3D box image (defaults are snap, wheel, fanart, marquee, flyer) artwork name can be found in emulator configuration in attract mode.", order=11 />
	Box3D = "BOX3D";
};

local config = fe.get_config();

fe.add_transition_callback( "onTransition" );

function onTransition( ttype, var, ttime ) {

	switch ( ttype )
	{

	case Transition.ToGame:

function processImage(imageKey) {
    local image = config[imageKey];

    function isBlankOrSpaces(str) {
        return str == null || str.len() == 0 || str.find("^\\s*$") != null;
    }

    function isValidImageExtension(str) {
        local validExtensions = [ ".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tiff", ".webp" ];
        foreach(ext in validExtensions) {
            if (str.slice(-ext.len()) == ext) {
                return true;
            }
        }
        return false;
    }

    if (isBlankOrSpaces(image) || isBlankOrSpaces(image = fe.get_art(image))) {
        image = "-";
    }

    // Final check for valid image extension
    if (image != "-" && !isValidImageExtension(image)) {
        image = "-";
    }

    return image;
}


local BGImage = processImage("BGImage");
local FrontImage = processImage("FrontImage");
local ClearLogo = processImage("ClearLogo");
local CARTDISK3D = processImage("CARTDISK3D");
local CARTDISK2D = processImage("CARTDISK2D");
local ScreenShot = processImage("ScreenShot");
local CartBack = processImage("CartBack");
local Box3D = processImage("Box3D");
local BoxBack = processImage("BoxBack");

local GamePlatform;
if (config["GamePlatform"] == "System token")
{
GamePlatform = fe.game_info(Info.System)
}

if (config["GamePlatform"] == "Display name")
{
GamePlatform = fe.displays[fe.list.display_index].name
}

if (config["GamePlatform"] == "Emulator name")
{
GamePlatform = fe.game_info(Info.Emulator)
}

local PlatformClearLogo = config["PlatformClearLogo"]
local AMdirectory = fe.path_expand("$PROGDIR")
local EmuAppPath = "-"
local GameTitle = fe.game_info(Info.Title)
local GameYear = fe.game_info(Info.Year)
local RomName = fe.game_info(Info.Name)



local command = "\"" + AMdirectory + "|" + EmuAppPath  + "|" + GamePlatform + "|" + GameTitle + "|" + BGImage + "|" + ClearLogo + "|" + FrontImage + "|-|-|" + ScreenShot + "|-|-|" + GameYear + "|-|" + PlatformClearLogo + "|-|" + CARTDISK3D + "|" + CARTDISK2D + "|" + CartBack + "|" + Box3D + "|" + BoxBack + "\" \"\" \"" + RomName + "\""

		fe.plugin_command_bg("$PROGDIR\\Super pause menu\\Super pause menu.exe", command )

		break;


	}

	return false; // must return false
}