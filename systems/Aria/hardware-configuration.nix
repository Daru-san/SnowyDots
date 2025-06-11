{
  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
    tmpfsSize = "70%";
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

    "/mnt/LinFs" = {
      device = "/dev/disk/by-uuid/25bc9c69-c366-46f7-b0cb-8e73911f57d1";
      fsType = "xfs";
    };

    "/mnt/forest" = {
      device = "/dev/disk/by-uuid/d82bb92e-1dff-46ab-9553-1ed958915ea2";
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
