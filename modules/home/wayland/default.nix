{
  imports = [
    ./common
    ./niri
    ./hyprland
  ];
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
