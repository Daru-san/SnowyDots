{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.services.blanket;
  inherit (lib) mkIf mkEnableOption mkPackageOption hm platforms;
in {
  options = {
    enable = mkEnableOption "Enable the blanket service";
    package = mkPackageOption pkgs.blanket "Package for blanket";
  };
  config = mkIf cfg.enable {
    assertions = [
      (hm.assertions.assertPlatform "services.easyeffects" pkgs platforms.linux)
    ];

    home.packages = [cfg.package];

    systemd.user.services.blanket = {
      Unit = {
        Description = "Blanket daemon";
        Requires = ["dbus.service"];
        After = ["graphical-session-pre.target"];
        PartOf = ["graphical-session.target" "pipewire.service"];
      };
      Install.WantedBy = ["graphical-session.target"];
      Service = {
        ExecStart = "${cfg.package}/bin/blanket --gapplication-service";
        Restart = "on-failure";
        RestartSec = 5;
      };
    };
  };
}
