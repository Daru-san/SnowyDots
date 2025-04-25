{ inputs, pkgs,... }:
{
  imports = [
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
    ./config
  ];
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];
  wayland = {
    systemd.target = "niri-session.target";
  };
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings.environment = {
      QT_QPA_PLATFORM = "wayland";
      NIXOS_OZONE_WL = "true";
      DISPLAY = ":0";
    };
  };
}
