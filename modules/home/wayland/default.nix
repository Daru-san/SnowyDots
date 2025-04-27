{
  imports = [
    ./common
    # ./hyprland
    ./niri
    ./sway
  ];
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
