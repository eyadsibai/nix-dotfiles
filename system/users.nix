{ pkgs, ... }: {

  users.users.eyad = {
    isNormalUser = true;
    extraGroups =
      [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user. (wheel)
    hashedPassword = "W7Sq2X5x5b9.o";
  };
}
