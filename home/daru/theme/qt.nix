{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.qtwayland
    qt5.qtwayland
  ];
  home.sessionVariables.QT_QPA_PLATFORM = "wayland";
  stylix.targets.qt.enable = true;
  qt = {
    enable = true;
  };
}
