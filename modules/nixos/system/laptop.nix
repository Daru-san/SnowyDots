{
  services.upower = {
    enable = true;
    percentageCritical = 20;
    percentageLow = 30;
    percentageAction = 15;
    criticalPowerAction = "HybridSleep";
    ignoreLid = true;
  };
  powerManagement.powertop.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "passive";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";
      INTEL_GPU_MIN_FREQ_ON_AC = "600";
      INTEL_GPU_MIN_FREQ_ON_BAT = "300";
      USB_AUTOSUSPEND = 0;
    };
  };
  boot.kernelParams = ["snd-intel-dspcfg.dsp_driver=1"];
}
