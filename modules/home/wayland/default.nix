{
  imports = [
    ./common
    ./hyprland
  ];
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = 1;
  };
}
