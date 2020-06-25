# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{lib, config, pkgs, ... }:

let
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
    # reuse the current configuration
    { config = config.nixpkgs.config; };

in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import (builtins.fetchTarball {
	url = 
	  "https://github.com/rycee/home-manager/archive/release-20.03.tar.gz";
      }) {inherit pkgs;}).nixos
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.enableRedistributableFirmware = true; # NOTE: required for wireless card

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

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

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kitty
    git
    sxhkd
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  #services.xserver.desktopManager.xterm.enable = true;
#  services.xserver.windowManager.bspwm.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver.desktopManager.session = [
  {
    name = "HomeManager";
    start = ''
      ${pkgs.runtimeShell} $HOME/.hm-xsession &
      waitPID=$!
    '';
  }
  ];

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eyad = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword= "W7Sq2X5x5b9.o";  
};

  home-manager.users.eyad = {pkgs, config, ...}:{ 
    
	programs.bash.enable = true;
	programs.vscode.enable = true;
    programs.htop.enable = true;
    programs.command-not-found.enable = true;
programs.vscode.extensions = [
    pkgs.vscode-extensions.ms-python.python
    pkgs.vscode-extensions.redhat.vscode-yaml
    # pkgs.vscode-extensions.tyriar.sort-lines
    # # pkgs.vscode-extensions.christian-kohler.path-intellisense
    # pkgs.vscode-extensions.akamud.vscode-theme-onedark
    # pkgs.vscode-extensions.mechatroner.rainbow-csv
    # pkgs.vscode-extensions.shyykoserhiy.vscode-spotify
    # pkgs.vscode-extensions.davidanson.vscode-markdownlint
    # pkgs.vscode-extensions.donjayamanne.githistory
    # pkgs.vscode-extensions.eamodio.gitlens
    # pkgs.vscode-extensions.vscode-icons-team.vscode-icons
    # pkgs.vscode-extensions.visualstudioexptteam.vscodeintellicode
    # pkgs.vscode-extensions.ms-azuretools.vscode-docker
    # pkgs.vscode-extensions.ms-vscode.powershell
    # pkgs.vscode-extensions.ms-vsliveshare.vsliveshare
    # pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
    # pkgs.vscode-extensions.ms-vscode-remote.remote-ssh-edit
    # pkgs.vscode-extensions.waderyan.gitblame
    # pkgs.vscode-extensions.kiteco.kite
    # pkgs.vscode-extensions.dcasella.i3
    # pkgs.vscode-extensions.teabyii.ayu
    # pkgs.vscode-extensions.vscoss.vscode-ansible
    # pkgs.vscode-extensions.pkief.material-icon-theme

  ];
	nixpkgs.config.allowUnfree = true;
	xsession.enable = true;
	
	xsession.profileExtra = ''
sxhkd &
'';
        xsession.scriptPath = ".hm-xsession";
	xsession.windowManager.bspwm.enable = false;
        xsession.windowManager.i3.enable = true;
        xsession.windowManager.i3.package = pkgs.i3-gaps; 
	
	xsession.windowManager.i3.config = {
	modifier = "Mod4";
	keybindings = let modifier = "Mod4";
	in lib.mkOptionDefault { "${modifier}+Return" = "exec kitty"; };

};


  home.packages = with pkgs; [
    pkgs.firefox
    pkgs.ncpamixer
    pkgs.zoom-us
    pkgs.dropbox
    pkgs.micro
    pkgs.jetbrains.idea-community
    pkgs.slack
    pkgs.bitwarden-cli
    pkgs.sc-im
    pkgs.skypeforlinux
    pkgs.haxor-news
    pkgs.cava
    pkgs.spotify
    pkgs.teamviewer
    pkgs.xsv
    pkgs.urlview
    pkgs.urlscan
    pkgs.s3cmd
    pkgs.mycli
    unstable.stig
    pkgs.git
    pkgs.gitAndTools.tig
    pkgs.mpv
    pkgs.teams
    # pkgs.mpvScripts.mpris
#    pkgs.mpvScripts.convert
    # pkgs.plex-mpv-shim
    pkgs.highlight
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-ls
    pkgs.nano
    pkgs.nanorc
    pkgs.maven
    unstable.mopidy-youtube
    pkgs.youtube-dl
    pkgs.mpd-small
    pkgs.ncmpcpp
    pkgs.mopidy
    pkgs.mopidy-spotify
    pkgs.alacritty
    pkgs.rofi
    pkgs.nnn
    pkgs.zathura
    pkgs.pdftk
    pkgs.unzip
    pkgs.unrar
    pkgs.fzf
    pkgs.gtop
    pkgs.gotop
    pkgs.fff
    pkgs.mpc_cli
    pkgs.nitrogen
    pkgs.sxhkd
    pkgs.ncpamixer
    pkgs.pavucontrol
    pkgs.pulseaudio
    pkgs.pulseaudio-ctl
    pkgs.mc
    pkgs.steam
    pkgs.screenkey
    pkgs.pywal
    pkgs.wpgtk
    pkgs.polybar
    pkgs.screenkey
    pkgs.bitwarden
    pkgs.oh-my-zsh
    pkgs.cointop
    pkgs.lazygit
    pkgs.pdfgrep
    pkgs.terminal-parrot
    pkgs.qutebrowser
    pkgs.signal-desktop
    pkgs.neomutt
    pkgs.discord
    pkgs.cmus
    pkgs.termite
    pkgs.feh
    pkgs.git-crypt
  ];
  



  
#	services.sxhkd = {
#		enable = true;
#		keybindings = {
#			"super + Return" = "kitty";
#	};
 #     };
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}
