{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.wayland;
in {
  imports = [./config];
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      settings.env = lib.mapAttrsToList (name: value: "${name},${builtins.toString value}") config.home.sessionVariables;
      enable = true;
      package = pkgs.hyprland;
      systemd = {
        enable = true;
        enableXdgAutostart = true;
      };
      settings = {source = ["extra.conf"];};
    };
  };
}
