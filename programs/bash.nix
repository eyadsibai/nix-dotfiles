{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableAutojump = true;
    initExtra = "neofetch";

  };
}
