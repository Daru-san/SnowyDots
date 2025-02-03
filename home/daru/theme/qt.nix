{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.qtwayland
    libsForQt5.qt5.qtwayland
  ];
  home.sessionVariables.QT_QPA_PLATFORM = "wayland";
  qt = {
    enable = true;
  };
}
