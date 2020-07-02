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

  # networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #networking.networkmanager.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens20u1u2.useDHCP = true; # change to true for stationary computer
  networking.interfaces.wlp59s0.useDHCP = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  time.timeZone = "Europe/Stockholm";


 networking.wireless.networks."centiro-private-wlan" = {
    auth = ''
      key_mgmt=WPA-EAP
      eap=PEAP
      identity="eyada@centiro.se"
      password=""
      phase1="peaplabel=2"
      phase2="auth=MSCHAPV2"
    '';
  };
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
