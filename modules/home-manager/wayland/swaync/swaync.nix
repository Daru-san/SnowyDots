{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.services.swaync;

  jsonFormat = pkgs.formats.json { };

  settingsJson = jsonFormat.generate "config.json" cfg.settings;
in
with lib;
{
  meta.maintainers = [ maintainers.daru-san ];
  options.services.swaync = {
    enable = mkEnableOption "Simple GTK notification daemon for wayland";

    package = mkPackageOption pkgs "swaynotificationcenter" { };

    systemdTarget = mkOption {
      type = with types; str;
      default = "graphical-session.target";
      example = "sway-session.target";
      description = mdDoc ''
        Systemd target to bind swaync to
      '';
    };

    settings = mkOption {
      inherit (jsonFormat) type;
      default = { };
      description = mdDoc ''
        Configuration for swaync in 'config.json', see
        <link xlink:href="https://github.com/ErikReider/SwayNotificationCenter#configuring"/>
        for supported values.
      '';
    };

    style = mkOption {
      type = with types; nullOr (either path lines);
      default = null;
      description = mdDoc ''
        Style for swaync in css
      '';
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "services.swaync" pkgs
        lib.platforms.linux)
    ];

    home.packages = [cfg.package];

    systemd.user.services.swaync = {
      Unit = {
        Description = "Simple GTK notification daemon for wayland";
        Documentation = "man:swaync(1)";
        PartOf = "graphical-session.target";
      };

      Service = {
        Type = "simple";
        Restart = "always";
        ExecStart = "${cfg.package}/bin/swaync";
        ExecReload = "${cfg.package}/bin/swaync-client --reload-config --reload-css";
      };

      Install = { WantedBy = [ cfg.systemdTarget ]; };
    };

    xdg.configFile."swaync/config.json" = mkIf (cfg.settings != { }) {
      source = settingsJson;
      onChange = ''
        ${cfg.package}/bin/swaync-client --reload-config
      '';
    };

    xdg.configFile."swaync/style.css" = mkIf (cfg.style != null) {
      source = pkgs.writeText "style.css" cfg.style;
      onChange = ''
        ${cfg.package}/bin/swaync-client --reload-css
      '';
    };
  };
}
