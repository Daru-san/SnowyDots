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
        advanced = mkEnableOption "Enable advanced tweaks";
      };
    };
    config = mkMerge [
      {services.earlyoom.enable = true;}
      (mkIf cfg.advanced {
        chaotic.scx = {
          enable = true;
          scheduler = "scx_simple";
        };
        services = {
          throttled.enable = true;
          thermald.enable = true;
        };
      })
      (mkIf cfg.desktop {
        zramSwap = {
          enable = true;
          memoryPercent = 150;
        };
        # hardware = {
        #fancontrol = {
        #  enable = true;
        #  config = {

        #  };
        # };
        #};
        boot = {
          kernel.sysctl."vm.swappiness" = "0.3";
          extraModulePackages = with config.boot.kernelPackages; [cpupower turbostat];
          kernelModules = ["cpupower" "turbostat"];
        };
      })
      (mkIf cfg.laptop {
        boot.kernel.sysctl."vm.swappiness" = "0.1";
        zramSwap = {
          enable = true;
          memoryPercent = 200;
        };
        services.auto-cpufreq = {
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
      (mkIf cfg.ssdTweaks {
        services.udev.extraRules = ''
          ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
        '';
        services.fstrim = {enable = true;};
      })
    ];
  }
