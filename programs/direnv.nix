{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;

  };
}
