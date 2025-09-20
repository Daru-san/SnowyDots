{ config, pkgs, ... }:
{
  environment.systemPackages = [
    config.boot.kernelPackages.cpupower
    pkgs.perf
  ];
  services = {
    logind.settings.Login.HandlePowerKey = "ignore";
    fwupd.enable = true;
    fstrim.enable = true;
    earlyoom.enable = true;
    thermald.enable = true;
  };
  programs.tuxclocker.enable = true;
  programs.mdevctl.enable = true;
  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"

    KERNEL=="uinput", MODE="0660", GROUP="uinput"
  '';
  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };
}
