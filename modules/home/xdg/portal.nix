{
  pkgs,
  lib,
  config,
  ...
}:
{
  enable = true;
  extraPortals =
    with pkgs;
    [
      xdg-desktop-portal-gtk
    ]
    ++ lib.optional (
      (config.wayland.windowManager.mango.enable or false)
      || (config.wayland.windowManager.sway.enable or false)
    ) xdg-desktop-portal-luminous
    ++ lib.optional config.programs.niri.enable or false xdg-desktop-portal-gnome;
  config = {
    sway = {
      default = [
        "gtk"
        "luminous"
      ];
    };
    niri = {
      default = [
        "gnome"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = "kde";
      "org.freedesktop.impl.portal.Access" = "gtk";
      "org.freedesktop.impl.portal.Notification" = "gtk";
      "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
    };
    mango = {
      default = [
        "luminous"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = "kde";
      "org.freedesktop.impl.portal.Access" = "gtk";
      "org.freedesktop.impl.portal.Notification" = "gtk";
      "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
    };
    hyprland = {
      default = [
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = "gnome";
      "org.freedesktop.impl.portal.Access" = "gtk";
      "org.freedesktop.impl.portal.Notification" = "gtk";
      "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
    };
  };
}
