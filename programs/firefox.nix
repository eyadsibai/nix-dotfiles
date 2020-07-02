{ pkgs, ... }:

{
  programs.firefox.enable = true;
}
#  environment.systemPackages =
#     if config.services.xserver.enable then
#       [ pkgs.firefox
#         pkgs.thunderbird
#       ]
#     else
#       [ ];
