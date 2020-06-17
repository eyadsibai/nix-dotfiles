{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.htop.enable = true;
  nixpkgs.config.allowUnfree = true;


  home.packages = [
    pkgs.ncpamixer
    pkgs.zoom-us
    pkgs.dropbox
    pkgs.micro
    pkgs.jetbrains.idea-community
    pkgs.slack
    # pkgs.python38Packages.rainbowstream # should create a different shell for it
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
    pkgs.stig
    pkgs.git
    pkgs.gitAndTools.tig
    pkgs.mpv
    pkgs.mpvScripts.mpris
    pkgs.mpvScripts.convert
    pkgs.plex-mpv-shim
    pkgs.highlight
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-ls
    pkgs.nano
    pkgs.nanorc
    pkgs.maven
    pkgs.mopidy-youtube
    pkgs.youtube-dl
    pkgs.mpd-small
    pkgs.ncmpcpp
    pkgs.mopidy
    pkgs.mopidy-spotify
    pkgs.alacritty
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

  programs.vscode.enable = true;
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

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "eyad";
  home.homeDirectory = "/home/eyad";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
