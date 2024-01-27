{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.services.swaync;

  jsonFormat = pkgs.formats.json {};
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
      example = "hyprland-session.target";
      description = ''
        Systemd target to bind swaync to
      '';
    };

    settings = mkOption {
      type = with types; submodule;
      default = {};
      description = ''
        Configuration for swaync, see
        <link xlink:href="https://github.com/ErikReider/SwayNotificationCenter#configuring"/>
        for supported values.
      '';
    };

    style = mkOption {
      type = nullOr (either path lines);
      default = null;
      description = ''
        Style for swaync in css
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
        ExecStart = "${cfg.package}/bin/swaync";
      };

      Install = { wantedBy = [ cfg.systemdTarget ]; };
    };

    xdg.configFile."swaync/config.json" = mkIf (cfg.settings != { }) {
      source = jsonFormat.generate "swaync-config.json" cfg.settings;
      onChange = ''
        ${cfg.package}/bin/swaync-client --reload-config
      '';
    };

    xdg.configFile."swaync/style.css" = mkIf (cfg.style != null) {
      source = if builtins.isPath cfg.style || isStorePath cfg.style then
        cfg.style
      else
        pkgs.writeText "style.css" cfg.style;
      onChange = ''
        ${cfg.package}/bin/swaync-client --reload-css
      '';
    };
  };
}
