{
  lib,
  pkgs,
  ...
}: {
  boot = {
    kernelParams = ["intel_pstate=passive"];
    kernelModules = ["coretemp"];
    initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" "rtsx_usb_sdmmc"];
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/30ccfaac-4d6a-4c46-82f6-074a297dddd1";
      fsType = "ext4";
      options = ["noatime" "nodiratime"];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/620efc74-668f-49a5-b824-9e4e297a3b91";
      fsType = "ext4";
      options = ["noatime" "nodiratime"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/EE38-B76E";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/2c99252a-5281-4d2a-ba37-a25e0926b3e7";
      fsType = "ext4";
    };
  };
  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
    firmware = [pkgs.rtw88-firmware];
  };
}
