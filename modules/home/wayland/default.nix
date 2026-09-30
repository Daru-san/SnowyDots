{
  imports = [
    ./common
    ./sway
    ./hyprland
    # ./niri
    ./mango
  ];
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = 1;
  };
}
