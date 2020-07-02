{ lib, config, pkgs, ... }: {
  programs.feh = {
    enable = true;
    keybindings = {
      menu_parent = "h";
      menu_parent = "Left";
      menu_child = "l";
      menu_down = "j";
      menu_up = "k";
      menu_select = "space";
    };
  };
}
