{
  lib,
  config,
  ...
}:
let
  cfg = config.wayland.windowManager.hyprland;
in
{
  imports = [
    ./config
  ];
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      systemd = {
        enable = true;
        enableXdgAutostart = true;
      };
      settings = {
        source = [ "extra.conf" ];
      };
    };
  };
}
