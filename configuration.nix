# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system/users.nix
      ./system/networking.nix
      ./system/xserver.nix
      ./system/packages.nix
      ./system/fonts.nix

      (import (builtins.fetchTarball {
	url =
	  "https://github.com/rycee/home-manager/archive/release-20.03.tar.gz";
      }) {inherit pkgs;}).nixos
    ];

  boot = {
kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware.enableRedistributableFirmware = true; # NOTE: required for wireless card


  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  time.timeZone = "Europe/Stockholm";


  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  hardware.bluetooth.enable = true;


  home-manager.users.eyad = import ./home.nix;

  system.stateVersion = "20.03"; # Did you read the comment?

}
