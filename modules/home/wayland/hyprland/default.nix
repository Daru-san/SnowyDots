{
  lib,
  config,
  inputs,
  system,
  ...
}:
let
  cfg = config.wayland.windowManager.hyprland;
in
{
  imports = [ ./config ];
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      settings.env = lib.mapAttrsToList (
        name: value: "${name},${builtins.toString value}"
      ) config.home.sessionVariables;
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
