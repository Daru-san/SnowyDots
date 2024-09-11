{ pkgs, ... }:
{
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-kde
    xdg-desktop-portal-gtk
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
