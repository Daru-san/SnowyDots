{pkgs, ...}: {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-kde
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
  config = {
    hyprland = {
      default = [
        "gtk"
        "hyprland"
      ];
      "org.freedesktop.impl.portal.FileChooser" = ["kde"];
    };
  };
}
