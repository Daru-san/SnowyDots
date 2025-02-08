{ pkgs, ... }:
{
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];
  config = {
    hyprland = {
      default = [
        "hyprland"
        "gnome"
      ];
    };
  };
}
