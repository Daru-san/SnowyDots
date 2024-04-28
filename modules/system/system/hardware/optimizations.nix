{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkMerge mkIf;
  cfg = config.os.system;
in {
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
      hardware.enableAllFirmware = true;
    })
    (mkIf cfg.laptop {
      zramSwap = {
        enable = true;
        memoryPercent = 200;
      };
      boot.kernelParams = ["video=eDP-1:d" "video=LVDS-1:d"];
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
