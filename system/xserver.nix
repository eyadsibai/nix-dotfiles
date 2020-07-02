{ pkgs, ... }: {

  services.xserver = {
    enable = true;
    #   layout = "fr";
    #   xkbOptions = "eurosign:e";

    # Enable touchpad support.
    libinput.enable = true;

    # Enable lightdm
    displayManager.lightdm.enable = true;
    desktopManager.xterm.enable = true;
    #       desktopManager.session = [
    #   {
    #     name = "HomeManager";
    #     start = ''
    #       ${pkgs.runtimeShell} $HOME/.hm-xsession &
    #       waitPID=$!
    #     '';
    #   }
    #   ];
  };

}
