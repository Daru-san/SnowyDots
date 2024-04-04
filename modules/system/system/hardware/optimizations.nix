{
  config,
  lib,
  ...
}: let
  cfg = config.os.system;
in
  with lib; {
    options = {
      os.system = {
        laptop = mkEnableOption "Enable laptop based tweaks";
        desktop = mkEnableOption "Enable desktop tweaks";
        ssdTweaks = mkEnableOption "Enable ssd tweaks";
      };
    };
    config = mkMerge [
      {
        chaotic.scx = {
          enable = true;
          scheduler = "scx_simple";
        };
        services = {
          earlyoom.enable = true;
          throttled.enable = true;
          thermald.enable = true;
        };
      }
      (
        mkIf cfg.desktop {
          zramSwap = {
            enable = true;
            memoryPercent = 150;
          };
        }
      )
      (mkIf cfg.laptop {
        zramSwap = {
          enable = true;
          memoryPercent = 200;
        };
        auto-cpufreq = {
          enable = true;
          settings = {
            charger = {
              governor = "performance";
              turbo = "always";
            };
            battery = {
              governor = "powersave";
              turbo = "auto";
            };
          };
        };
      })
      (mkIF cfg.ssdTweaks {
        udev.extraRules = ''
          ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
        '';
        fstrim = {enable = true;};
      })
    ];
  }
