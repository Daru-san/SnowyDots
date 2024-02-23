{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  cfg = config.os.system;
in
  with lib; {
    imports = [inputs.auto-cpufreq.nixosModules.default];
    options = {
      os.system = {
        laptop = {
          optimizations = {
            tlp.enable = mkEnableOption "Enable TLP";
            auto-cpufreq.enable = mkEnableOption "Enable auto-cpufreq custom tweaks";
          };
        };
        general = {
          ssd.enable = mkEnableOption "Enable ssd optimizations";
          intel.enable = mkEnableOption "Enable the throttled service";
        };
      };
    };
    config = {
      services.throttled.enable = mkIf cfg.general.intel.enable true;
      services.thermald.enable = mkIf cfg.general.intel.enable true;
      hardware.cpu.intel.updateMicrocode = mkIf cfg.general.intel.enable true;

      services.tlp.enable = mkIf cfg.laptop.optimizations.tlp.enable true;

      services.udev.extraRules = mkIf cfg.general.ssd.enable ''
        ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
      '';
      services.fstrim = mkIf cfg.general.ssd.enable {enable = true;};

      programs.auto-cpufreq = mkIf cfg.laptop.optimizations.auto-cpufreq.enable {
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
    };
  }
