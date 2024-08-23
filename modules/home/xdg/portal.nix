{
  pkgs,
  inputs,
  system,
  ...
}: {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-kde
    xdg-desktop-portal-gtk
  ];
  config = {
    sway = {
      default = [
        "wlr"
        "kde"
      ];
    };
    hyprland = {
      default = [
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = ["kde"];
    };
  };
}
