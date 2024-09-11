{ pkgs, ... }:
{
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-kde
    xdg-desktop-portal-gtk
  ];
  config = {
    preferred = {
      "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
    };
  };
}
