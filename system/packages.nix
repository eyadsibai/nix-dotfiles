{ pkgs, ... }: {

  services = {
    openssh.enable = true;
    printing = {
      enable = true;
      #drivers = [];
    };
    tlp.enable = true;
    blueman.enable = true;
  };
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
}
