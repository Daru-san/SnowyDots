{config, ...}: {
  services.upower = {
    enable = true;
    percentageCritical = 20;
    percentageLow = 30;
    percentageAction = 15;
    criticalPowerAction = "HybridSleep";
    ignoreLid = true;
  };
  services.auto-cpufreq = {
    enable = true;
    settings.charger = {
      governor = "performance";
      turbo = "always";
    };
    settings.battery = {
      governor = "powersave";
      turbo = "auto";
    };
  };
  boot.extraModulePackages = with config.boot.kernelPackages; [cpupower];
  powerManagement.resumeCommands = ''
    ${config.boot.kernelPackages.cpupower}/bin/cpupower frequency-set -g powersave
    ${config.boot.kernelPackages.cpupower}/bin/cpupower frequency-set -g performance
  '';
}
