{config, ...}: {
  services = {
    fstrim.enable = true;
    earlyoom.enable = true;
    thermald.enable = true;
  };
  boot.extraModulePackages = with config.boot.kernelPackages; [cpupower];
  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
  '';
  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };
  powerManagement.resumeCommands = ''
    ${config.boot.kernelPackages.cpupower}/bin/cpupower frequency-set -g powersave
    ${config.boot.kernelPackages.cpupower}/bin/cpupower frequency-set -g performance
  '';
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
}
