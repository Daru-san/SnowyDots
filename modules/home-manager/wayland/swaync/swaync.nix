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
  settingsFormat = pkgs.formats.json {};
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
    
    settings = mkOption {
      type = with types; submodule;
      freeformType = settingsFormat.type;
      default = {};
      description = ''
        Configuration for swaync, see
        <link xlink:href=""/>
        for supported values.
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
    services.foo.settings = {
    };

    xdg.configFile."swaync/config.json".source = settingsFormat.generate "swaync-config.json" cfg.settings;
  };
}
