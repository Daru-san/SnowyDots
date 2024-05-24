{lib, ...}: {
  boot.initrd.availableKernelModules = ["ahci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc"];
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/4865efd3-d132-42da-bd9c-c7ba12859995";
      fsType = "ext4";
      options = ["noatime"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/f67337aa-703f-453c-945c-a7fb062da185";
      fsType = "ext4";
      options = ["noatime"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/AF22-035F";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };
  };
  swapDevices = [];
  networking.useDHCP = lib.mkDefault true;
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
}
