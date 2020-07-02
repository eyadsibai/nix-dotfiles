
{ pkgs, lib, ... }:
{
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
