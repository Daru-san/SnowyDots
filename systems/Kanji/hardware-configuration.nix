{
  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
    tmpfsSize = "70%";
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/19ee6347-b472-4bf5-8bef-97e2fd32eb4b";
      fsType = "ext4";
    };

    "/home" = {
      device = "/dev/disk/by-uuid/07075934-d163-41a5-81f5-23cbd5528c95";
      fsType = "ext4";
    };

    "/mnt/frost" = {
      device = "/dev/disk/by-label/soft";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/7ED4-6E7F";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
  };

  swapDevices = [ ];
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
}
