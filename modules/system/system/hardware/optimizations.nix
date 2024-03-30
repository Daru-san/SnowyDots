{
  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };
  chaotic.scx = {
    enable = true;
    scheduler = "scx_rusty";
  };
  services = {
    earlyoom.enable = true;
    throttled.enable = true;
    thermald.enable = true;
    udev.extraRules = ''
      ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
    '';
    fstrim = {enable = true;};
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
  };
}
