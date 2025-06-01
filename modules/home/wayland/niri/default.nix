{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
    ./config
  ];
  config = lib.mkIf config.programs.niri.enable {
    nixpkgs.overlays = [
      inputs.niri.overlays.niri
    ];
    wayland = {
      systemd.target = "niri-session.target";
    };
    programs.niri = {
      package = pkgs.niri;
      settings.environment = {
        QT_QPA_PLATFORM = "wayland";
        NIXOS_OZONE_WL = "true";
        DISPLAY = ":0";
      };
    };
  };
}
