{pkgs, ...}: {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-kde
    xdg-desktop-portal-wlr
  ];
  config = {
    sway = {
      default = ["wlr" "kde"];
    };
    hyprland = {
      default = ["hyprland" "gtk"];
      "org.freedesktop.impl.portal.FileChooser" = ["kde"];
    };
  };
}
