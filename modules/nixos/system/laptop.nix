{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.system.laptop;
in
{
  options.system.laptop = mkEnableOption "Enable laptop configuration";
  config = mkIf cfg {
    hardware.bluetooth.enable = true;
    services = {
      blueman.enable = true;
      upower = {
        enable = true;
        percentageCritical = 20;
        percentageLow = 30;
        percentageAction = 15;
        criticalPowerAction = "HybridSleep";
        ignoreLid = true;
      };
      tlp = {
        enable = true;
        settings = {
          CPU_DRIVER_OPMODE_ON_AC = "active";
          CPU_DRIVER_OPMODE_ON_BAT = "passive";
          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
          CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
          PLATFORM_PROFILE_ON_AC = "performance";
          PLATFORM_PROFILE_ON_BAT = "balanced";
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
          RUNTIME_PM_ON_AC = "on";
          RUNTIME_PM_ON_BAT = "auto";
          INTEL_GPU_MIN_FREQ_ON_AC = "650";
          INTEL_GPU_MIN_FREQ_ON_BAT = "300";
          USB_AUTOSUSPEND = 0;
          NMI_WATCHDOG = 0;
        };
      };
      undervolt = {
        enable = true;
        tempAc = 77;
        tempBat = 64;
        turbo = 0;
        useTimer = true;
        p1 = {
          window = 10;
          limit = 5;
        };
        p2 = {
          window = 30;
          limit = 6;
        };
      };
    };
    powerManagement.powertop.enable = true;
    boot.kernelParams = [ "snd-intel-dspcfg.dsp_driver=1" ];
  };
}
