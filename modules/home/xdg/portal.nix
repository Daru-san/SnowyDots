{pkgs, ...}: {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-kde
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
  ];
  config = {
    sway = {
      default = ["wlr" "kde"];
    };
    hyprland = {
      default = ["hyprland" "kde"];
    };
  };
}
