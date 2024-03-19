{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.os.system;
in
  with lib; {
    options = {
      os.system = {
        zram.enable = mkEnableOption "Enable zram swapping";
        optimizations = {
          laptop.enable = mkEnableOption "Tweaks for laptops to improve performance and battery life";
          ssd.enable = mkEnableOption "Enable ssd optimizations";
          intel.enable = mkEnableOption "Enable intel tweaks";
          cpu.enable = mkEnableOption "Enable cpu tweaks";
        };
      };
    };
    config = mkMerge [
      (mkIf cfg.zram.enable {zramSwap.enable = true;})
      (mkIf cfg.optimizations.cpu.enable {
        boot.kernelModules = ["cpupower"];
        services.cpupower-gui.enable = true;
      })
      (mkIf cfg.optimizations.intel.enable {
        services.throttled.enable = true;
        services.thermald.enable = true;
        hardware.cpu.intel.updateMicrocode = mkDefault true;
      })
      (mkIf cfg.optimizations.ssd.enable {
        services.udev.extraRules = ''
          ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
        '';
        services.fstrim = {enable = true;};
      })
      (mkIf cfg.optimizations.laptop.enable {
        services.auto-cpufreq = {
          enable = true;
          settings = {
            charger = {
              governor = "performance";
              turbo = "auto";
            };
            battery = {
              governor = "powersave";
              turbo = "auto";
            };
          };
        };
      })
    ];
  }
