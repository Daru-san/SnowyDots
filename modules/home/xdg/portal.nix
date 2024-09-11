{ pkgs, ... }:
{
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-kde
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
  config = {
    sway = {
      default = [
        "wlr"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
    };
  };
}
