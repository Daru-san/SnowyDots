{
  programs.tuxclocker.enable = true;
  services = {
    fstrim.enable = true;
    earlyoom.enable = true;
    thermald.enable = true;
    cpupower-gui.enable = true;
  };
  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
  '';
  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };
}
