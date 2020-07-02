{ lib, config, pkgs, ... }: {

  programs.autorandr = {
    enable = true;
    hooks = {
      postswitch = {
        "notify-i3" = "${pkgs.i3}/bin/i3-msg restart";
        "change-background" = readFile ./change-background.sh;
        "change-dpi" = ''
          case "$AUTORANDR_CURRENT_PROFILE" in
            default)
              DPI=120
              ;;
            home)
              DPI=192
              ;;
            work)
              DPI=144
              ;;
            *)
              echo "Unknown profle: $AUTORANDR_CURRENT_PROFILE"
              exit 1
          esac

          echo "Xft.dpi: $DPI" | ${pkgs.xorg.xrdb}/bin/xrdb -merge
        '';
      };
    };
    profiles = {
      "work" = {
        fingerprint = {
          eDP1 = "<EDID>";
          DP1 = "<EDID>";
        };
        config = {
          eDP1.enable = false;
          DP1 = {
            enable = true;
            crtc = 0;
            primary = true;
            position = "0x0";
            mode = "3840x2160";
            gamma = "1.0:0.909:0.833";
            rate = "60.00";
            rotate = "left";
          };
        };
        hooks.postswitch = readFile ./work-postswitch.sh;
      };
    };
  };
}
