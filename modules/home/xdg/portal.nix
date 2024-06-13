{pkgs, ...}: {
  enable = true;
  xdgOpenUsePortal = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-hyprland
    # xdg-desktop-portal-wlr
    # xdg-desktop-portal-kde
    # xdg-desktop-portal-gtk
  ];
}
