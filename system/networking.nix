{ pkgs, ... }: {
  networking = {
    hostName = "eyad-nixos";
    wireless.enable = true; # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;

  };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens20u1u2.useDHCP =
    true; # change to true for stationary computer
  networking.interfaces.wlp59s0.useDHCP = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
}
