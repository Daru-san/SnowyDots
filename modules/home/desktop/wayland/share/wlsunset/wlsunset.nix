{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.wlsunset-test;
in
  with lib; {
    meta.maintainers = [hm.maintainers.matrss];

    options.services.wlsunset-test = {
      enable = mkEnableOption "wlsunset";

      package = mkOption {
        type = with types; package;
        default = pkgs.wlsunset;
        defaultText = "pkgs.wlsunset";
        description = ''
          wlsunset derivation to use.
        '';
      };

      latitude = mkOption {
        type = with types; nullOr (either float (either str int));
        default = null;
        example = "-74.3";
        description = ''
          Your current latitude, between `-90.0` and
          `90.0`.
        '';
      };

      longitude = mkOption {
        type = with types; nullOr (either float (either str int));
        default = null;
        example = "12.5";
        description = ''
          Your current longitude, between `-180.0` and
          `180.0`.
        '';
      };

      temperature = {
        day = mkOption {
          type = with types; int;
          default = 6500;
          description = ''
            Colour temperature to use during the day, in Kelvin (K).
            This value must be greater than `temperature.night`.
          '';
        };

        night = mkOption {
          type = with types; int;
          default = 4000;
          description = ''
            Colour temperature to use during the night, in Kelvin (K).
            This value must be smaller than `temperature.day`.
          '';
        };
      };

      gamma = mkOption {
        type = with types; either float (either str int);
        default = 1.0;
        description = ''
          Gamma value to use.
        '';
      };

      output = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Name of output to use, by default all outputs are used.
        '';
      };

      sunrise = mkOption {
        type = with types; nullOr str;
        default = null;
        example = "06:30";
        description = ''
          The time when the sun rises (in 24 hour format).
        '';
      };

      sunset = mkOption {
        type = with types; nullOr str;
        default = null;
        example = "18:00";
        description = ''
          The time when the sun sets (in 24 hour format).
        '';
      };

      systemdTarget = mkOption {
        type = with types; str;
        default = "graphical-session.target";
        description = ''
          Systemd target to bind to.
        '';
      };
    };

    config = mkIf cfg.enable {
      assertions = [
        (lib.hm.assertions.assertPlatform "services.wlsunset" pkgs
          lib.platforms.linux)
        {
          assertion =
            (cfg.sunrise != null && cfg.sunset != null)
            != (cfg.latitude != null && cfg.longitude != null)
            && (cfg.sunrise != null || cfg.sunrise != null) != (cfg.latitude != null && cfg.longitude != null);
          message = "Either `sunset` and `sunrise` or `latitude` and `longitude` have to be set for wlsunset";
        }
      ];

      systemd.user.services.wlsunset = {
        Unit = {
          Description = "Day/night gamma adjustments for Wayland compositors.";
          PartOf = ["graphical-session.target"];
        };

        Service = {
          ExecStart = let
            args = cli.toGNUCommandLineShell {} {
              t = cfg.temperature.night;
              T = cfg.temperature.day;
              g = cfg.gamma;
              l = cfg.latitude;
              L = cfg.longitude;
              S = cfg.sunrise;
              s = cfg.sunset;
              o = cfg.output;
            };
          in "${cfg.package}/bin/wlsunset ${args}";
        };

        Install = {WantedBy = [cfg.systemdTarget];};
      };
    };
  }
