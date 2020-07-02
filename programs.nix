{ lib, config, pkgs, ... }: {

  imports = [
    ./programs/alacritty.nix
    ./programs/aria2.nix
    ./programs/autorandr.nix
    ./programs/bash.nix
    ./programs/bat.nix
    ./programs/broot.nix
    ./programs/compton/nix
    ./dircolors.nix
    ./direnv.nix
    ./firefox.nix
    ./git.nix
  ];
}
