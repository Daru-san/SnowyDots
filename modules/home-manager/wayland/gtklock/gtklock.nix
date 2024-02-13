{ pkgs, lib, config, ... }:
let
  cfg = config.services.gtklock;

  iniFormat = pkgs.formats.ini { };

  gtklockConfig = with types;
    submodule {
      freeformType = iniFormat.type;
      main = {
        gtk-theme = {
          name = mkOption {
            type = with types; str;
            default = null;
          };
          package = mkPackageOption "Gtk theme package";
        };
        modules = mkOption {
          type = with types; str;
          default = "";
          example = literalExpression "";
        };
        background = mkOption {
          type = with types; path;
          default = null;
        };
        idle-hide = mkEnableOption "Hide form when idle";
        time-format = mkOption { type = with types; nullOr str; };
        idle-timeout = mkOption {
          type = with types; nullOr ints.unsigned;
          default = null;
          example = 50;
        };
        lock-command = mkOption {
          type = with types; listOf str;
          example = "";
          default = null;
        };
        unlock-command = {
          type = with types; listOf str;
          example = "";
          default = null;
        };
        start-hidden = mkEnableOption "Start with hidden form";
      };
    };
in with lib; {
  meta.maintainers = [ hm.maintainers.daru-san ];

  options.services.swaync = {
    enable = mkEnableOption "Gtk lockscreen for wayland";

    package = mkPackageOption pkgs "gtklock" { };

    settings = {
      type = either (attrsOf gtklockConfig);
      default = { };
      example = literalExpression ''
        {
          positionX = "right";
          positionY = "top";

          widgets = [
            "title"
            "mpris"
          ];
        };
      '';
      description = mdDoc ''
        Configuration for gtklock in 'config.ini', see
        <link xlink:href=""/>
        for supported values.
      '';
    };

    style = mkOption {
      type = with types; nullOr (either path lines);
      default = null;
      description = mdDoc ''
        Style for gtklock in css
      '';
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "programs.gtklock" pkgs
        lib.platforms.linux)
    ];

    home.packages = [ cfg.package ];

    xdg.configFile."gtklock/config.ini" =
      mkIf (cfg.settings != { }) { source = gtklockConfig; };

    xdg.configFile."gtklock/style.css" = mkIf (cfg.style != null) {
      source = pkgs.writeText "style.css" cfg.style;
    };
  };
}
