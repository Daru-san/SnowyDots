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
  services.undervolt = {
    enable = true;
    tempAc = 71;
    tempBat = 55;
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
  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };
}
