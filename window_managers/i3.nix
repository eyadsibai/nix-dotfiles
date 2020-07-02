{ pkgs, lib, ... }:

{
    xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps; 
    config = {
	modifier = "Mod4";
	keybindings = let modifier = "Mod4";
	in lib.mkOptionDefault { "${modifier}+Return" = "exec kitty"; };

};
    };
}