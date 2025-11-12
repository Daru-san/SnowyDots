{
  imports = [
    ./common
    ./sway
    ./hyprland
    ./niri
  ];
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
