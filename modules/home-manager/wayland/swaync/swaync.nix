## TODO:
# - Create configuration options
# - Finalize module
# - Make a PR at upstream
# - Profit
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.services.swaync;
in 
with lib;
{
  meta.maintainers = [ maintainers.daru-san ];
  options.services.swaync = {
    enable = mkEnableOption "Simple GTK notification daemon for wayland";

    package = lib.mkPackageOption pkgs "swaynotificationcenter" { };

    systemdTarget = mkOption {
      type = with types; str;
      default = "graphical-session.target";
      example = "hyprland-session.target";
      description = ''
        Systemd target to bind swaync to
      '';
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "services.swaync" pkgs
        lib.platforms.linux)
    ];

    home.packages = with pkgs; [cfg.package];

    systemd.user.services.swaync = {
      Unit = {
        Description = "Notification daemon for wayland";
        Documentation = "man:swaync(1)";
        partOf = "graphical-session.target";
      };

      Service = {
        Type = "simple";
        Restart = "always";
        ExecStart = "${cfg.package}/bin/swaync;
      };

      Install = { wantedBy = [ cfg.systemdTarget ]; };
    };
  };
}
