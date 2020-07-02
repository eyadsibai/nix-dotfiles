{
  programs.broot.skin = {
    status_normal_fg = "grayscale(18)";
    status_normal_bg = "grayscale(3)";
    status_error_fg = "red";
    status_error_bg = "yellow";
    tree_fg = "red";
    selected_line_bg = "grayscale(7)";
    permissions_fg = "grayscale(12)";
    size_bar_full_bg = "red";
    size_bar_void_bg = "black";
    directory_fg = "lightyellow";
    input_fg = "cyan";
    flag_value_fg = "lightyellow";
    table_border_fg = "red";
    code_fg = "lightyellow";
  };
  programs.alacritty.colors = {
    primary = {
      background = "0x000000";
      foreground = "0xEBEBEB";
    };
    cursor = {
      text = "0xFF261E";
      cursor = "0xFF261E";
    };
    normal = {
      black = "0x040404";
      red = "0x54534d";
      green = "0x704f2d";
      yellow = "0x706451";
      blue = "0x7d7360";
      magenta = "0xb09063";
      cyan = "0x5b656b";
      white = "0xc6c5c0";
    };
    bright = {
      black = "0x040404";
      red = "0x696860";
      green = "0x886138";
      yellow = "0x877861";
      blue = "0x948974";
      magenta = "0xCCA773";
      cyan = "0x737F86";
      white = "0xc6c5c0";
    };
  };

  programs.bat.config.theme = "TwoDark";

  programs.dircolors.settings = {
    OTHER_WRITABLE = "30;46";
    ".sh" = "01;32";
    ".csh" = "01;32";
  };
}
