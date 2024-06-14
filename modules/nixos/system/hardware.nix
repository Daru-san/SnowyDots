{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.firmware = [pkgs.rtw88-firmware];
  boot.extraModprobeConfig = lib.concatLines [
    "options rtw88_8822bu rtw_switch_usb_mode=1 "
  ];
  environment.systemPackages = [
    config.boot.kernelPackages.cpupower
  ];
  programs.tuxclocker.enable = true;
  services = {
    fwupd.enable = true;
    fstrim.enable = true;
    earlyoom.enable = true;
    thermald.enable = true;
  };
  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
  '';
  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };
}
