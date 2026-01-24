{
  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
    tmpfsSize = "70%";
  };

  boot.initrd.luks.devices = {
    frozen = {
      name = "Cold Storage";
      preLVM = true;
      device = "/dev/disk/by-uuid/795c34e7-f791-45d8-a9c5-0ac58d8ba75e";
      allowDiscards = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/50eefb2e-874f-4fa1-b03a-3c3c880b8f24";
      fsType = "xfs";
    };

    "/home" = {
      device = "/dev/disk/by-uuid/07075934-d163-41a5-81f5-23cbd5528c95";
      fsType = "ext4";
    };

    "/mnt/frost" = {
      device = "/dev/mapper/frozen";
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
