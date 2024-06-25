{pkgs, ...}: {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-kde
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
