{ pkgs, ... }:
{
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-wlr
  ];
  config = {
    hyprland = {
      default = [
        "gtk"
        "wlr"
      ];
      "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
    };
  };
}
