{ config, ... }:
{
  environment.systemPackages = [
    config.boot.kernelPackages.cpupower
  ];
  services = {
    logind.powerKey = "ignore";
    fwupd.enable = true;
    fstrim.enable = true;
    earlyoom.enable = true;
    thermald.enable = true;
  };
  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"

    KERNEL=="uinput", MODE="0660", GROUP="uinput"
  '';
  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };
}
