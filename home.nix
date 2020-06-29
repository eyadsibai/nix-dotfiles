{ lib, config, pkgs, ... }:
let
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
    in
{
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  # programs with configs
  programs.htop.enable = true;
  programs.bash.enable = true;
  programs.command-not-found.enable = true;

  xsession = {
    enable = true;
    profileExtra = ''
                    sxhkd &
                  '';
    scriptPath = ".hm-xsession";
    windowManager.bspwm.enable = false;
    windowManager.i3.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;
    windowManager.i3.config = {
	modifier = "Mod4";
	keybindings = let modifier = "Mod4";
	in lib.mkOptionDefault { "${modifier}+Return" = "exec kitty"; };

};
  };
  programs.newsboat.enable = true;
  programs.feh.enable = true;
  programs.firefox.enable = true;
  programs.fzf.enable = true;
  programs.git.enable = true;
  programs.gpg.enable = true;
  programs.jq.enable = true;
  programs.kitty.enable = true;
  programs.lf.enable = true;
  # programs.lieer.enable = true;
  # programs.lsd.enable = true;

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;
  gtk.enable = true;




  home.packages = [
    pkgs.firefox
    # pkgs.htop
    pkgs.ncpamixer
    pkgs.zoom-us
    pkgs.dropbox
    pkgs.micro
    pkgs.jetbrains.idea-community
    pkgs.slack
    pkgs.bitwarden-cli
    pkgs.sc-im
    pkgs.curl
    pkgs.ack
    pkgs.rsync
    pkgs.tmux
    # pkgs.jq
    pkgs.st
    pkgs.farbfeld
    pkgs.w3m
    pkgs.xcape
    pkgs.ncdu
    pkgs.espeak
    pkgs.nethogs
    pkgs.sysstat
    pkgs.nload
    pkgs.wavemon
    pkgs.yq
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
    pkgs.pyradio
    pkgs.termshark
    pkgs.slack-term
    pkgs.mopidy-gmusic
    pkgs.mopidy-mpris
    pkgs.mopidy-soundcloud
    pkgs.autojump
    pkgs.cawbird
    pkgs.dialog
    pkgs.rofi-emoji
    pkgs.rtv
    pkgs.khal
    pkgs.stig
    pkgs.asciinema
    pkgs.colorz
    pkgs.rmlint
    pkgs.mediainfo
    pkgs.tldr
    pkgs.thefuck
    pkgs.mps-youtube
    pkgs.redshift
    pkgs.tty-clock
    pkgs.clerk
    pkgs.catimg
    pkgs.jp2a
    pkgs.chafa
    pkgs.curseofwar
    pkgs.units
    pkgs.fdupes
    pkgs.arandr
    pkgs.git
    pkgs.gitAndTools.tig
    pkgs.mpv
    pkgs.teams
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
    pkgs.sxhkd
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
        # pkgs.mpvScripts.mpris
#    pkgs.mpvScripts.convert
    # pkgs.plex-mpv-shim
    pkgs.kitty
    pkgs.gitter
    pkgs.flatpak
    pkgs.cli-visualizer
    pkgs.tdesktop
    pkgs.brave
    pkgs.ditaa
    pkgs.speedtest-cli
    pkgs.calcurse
    pkgs.neovim
    pkgs.broot
    pkgs.tree
    # pkgs.newsboat
    pkgs.wine
    pkgs.xclip
    pkgs.mpdris2
    pkgs.wifite2
    pkgs.reaverwps-t6x
    pkgs.httping
    pkgs.neofetch
    pkgs.xdotool
    pkgs.playerctl
    pkgs.rclone
    pkgs.pgcli
    pkgs.nettools
    pkgs.rlwrap
    pkgs.wireshark-cli
    pkgs.aws
    pkgs.termdown
    pkgs.etcher
    pkgs.gcalcli
    pkgs.spotify-tui
    pkgs.ddgr
    pkgs.gitAndTools.grv
    pkgs.glances
    pkgs.pulsemixer
  ];


  programs.vscode = {
    enable = true;
    extensions = [
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
  };


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
