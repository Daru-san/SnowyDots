{ pkgs, ... }:
{
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];
  config = {
    hyprland = {
      default = [
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Access" = "gtk";
      "org.freedesktop.impl.portal.Notification" = "gtk";
      "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
    };
  };
}
