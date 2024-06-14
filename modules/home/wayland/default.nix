{
  imports = [./sway ./common ./hyprland];
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
  };
}
