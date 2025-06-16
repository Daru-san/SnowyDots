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
    # ./hyprshell.nix
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
