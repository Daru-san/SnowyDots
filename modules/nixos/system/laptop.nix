{config, ...}: {
  services.upower = {
    enable = true;
    percentageCritical = 20;
    percentageLow = 30;
    percentageAction = 15;
    criticalPowerAction = "HybridSleep";
    ignoreLid = true;
  };
  services = {
    cpupower-gui.enable = true;
    auto-cpufreq.enable = true;
    auto-cpufreq = {
      settings.charger = {
        governor = "performance";
        turbo = "always";
      };
      settings.battery = {
        governor = "powersave";
        turbo = "auto";
      };
    };
  };
  boot.kernelParams = ["snd-intel-dspcfg.dsp_driver=1"];
  boot.extraModulePackages = with config.boot.kernelPackages; [cpupower];
  powerManagement.resumeCommands = ''
    ${config.boot.kernelPackages.cpupower}/bin/cpupower frequency-set -g powersave
    ${config.boot.kernelPackages.cpupower}/bin/cpupower frequency-set -g performance
  '';
}
