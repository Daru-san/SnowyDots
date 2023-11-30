{ config, lib, pkgs, ... }:

let

  cfg = config.services.easyeffects;

in {
  meta.maintainers = [ lib.maintainers.Daru-san ];

  options.services.easyeffects = {
    enable =
      lib.mkEnableOption "easyeffects";

    package = lib.mkPackageOption pkgs "easyeffects" { };

    systemdTarget = lib.mkOption {
      type = lib.types.str;
      default = "graphical-session.target";
      example = "sway-session.target";
      description = ''
        The systemd target that will automatically start the easyeffects service.

        When setting this value to `"sway-session.target"`,
        make sure to also enable {option}`wayland.windowManager.sway.systemd.enable`,
        otherwise the service may never be started.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "services.easyeffects" pkgs
        lib.platforms.linux)
    ];

    home.packages = [ cfg.package ];

    systemd.user.services.easyeffects = {
      Unit = {
        Description = "easyeffects";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = "${cfg.package}/bin/easyeffects --gapplication-service";
        Restart = "on-failure";
      };

      Install = { WantedBy = [ cfg.systemdTarget ]; };
    };
  };
}
