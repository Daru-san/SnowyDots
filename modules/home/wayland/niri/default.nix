{ inputs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ./config
  ];
  wayland.systemd.target = "niri-session.target";
  programs.niri = {
    enable = true;
    settings.environment = {
      QT_QPA_PLATFORM = "wayland";
      NIXOS_OZONE_WL = "true";
      DISPLAY = ":0";
    };
  };
}
