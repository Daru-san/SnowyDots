{ pkgs, ... }:
{
  services.flatpak = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
