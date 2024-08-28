{lib, ...}: {
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" "rtsx_usb_sdmmc"];

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/7ED4-6E7F";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/1de88fe7-5fe8-4e0b-ad00-fdc3cb452408";
      fsType = "btrfs";
      options = ["subvol=nix"];
    };

    "/etc" = {
      device = "/dev/disk/by-uuid/1de88fe7-5fe8-4e0b-ad00-fdc3cb452408";
      fsType = "btrfs";
      options = ["subvol=etc"];
    };

    "/var" = {
      device = "/dev/disk/by-uuid/1de88fe7-5fe8-4e0b-ad00-fdc3cb452408";
      fsType = "btrfs";
      options = ["subvol=var"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = ["subvol=home"];
    };

    "/home/daru/Music" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = [
        "subvol=music"
        "rw"
        "compress=zstd"
        "discard"
      ];
    };

    "/home/daru/snow" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = [
        "subvol=snow"
        "rw"
        "compress=zstd"
        "discard"
      ];
    };

    "/home/daru/Videos" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = [
        "subvol=Videos"
        "rw"
        "compress=zstd"
        "discard"
      ];
    };

    "/home/daru/Wallpapers" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = [
        "subvol=Wallpapers"
        "rw"
        "compress=zstd"
        "discard"
      ];
    };

    "/home/daru/Misc" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = [
        "subvol=Misc"
        "rw"
        "compress=zstd"
        "discard"
      ];
    };

    "/home/daru/Development" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = [
        "subvol=repos"
        "rw"
        "compress=zstd"
        "discard"
      ];
    };

    "/home/daru/Documents" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = [
        "subvol=documents"
        "rw"
        "compress=zstd"
        "discard"
      ];
    };

    "/home/daru/Pictures" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = [
        "subvol=pictures"
        "rw"
        "compress=zstd"
        "discard"
      ];
    };
  };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };
}
