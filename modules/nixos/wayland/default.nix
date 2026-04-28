{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.wayland;
in
{
  options.wayland.enable = mkEnableOption "Enable wayland";
  config = mkIf cfg.enable {
    programs = {
      dconf.enable = true;
      seahorse.enable = true;
      niri.enable = false;
      weylus = {
        enable = true;
        users = [ "daru" ];
        openFirewall = true;
      };
      hyprland = {
        enable = true;
      };
    };
    security.soteria.enable = true;
    programs.regreet.enable = true;
  };
}
