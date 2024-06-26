{lib, ...}: {
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" "rtsx_usb_sdmmc"];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/38d10da5-6c7c-4eb2-b614-ad20a1a795e8";
      fsType = "btrfs";
      options = ["subvol=root" "compress=zstd"];
    };

    "/etc" = {
      device = "/dev/disk/by-uuid/38d10da5-6c7c-4eb2-b614-ad20a1a795e8";
      fsType = "btrfs";
      options = ["subvol=etc" "compress=zstd"];
    };

    "/tmp" = {
      device = "/dev/disk/by-uuid/38d10da5-6c7c-4eb2-b614-ad20a1a795e8";
      fsType = "btrfs";
      options = ["subvol=tmp" "compress=zstd"];
    };

    "/persist" = {
      device = "/dev/disk/by-uuid/38d10da5-6c7c-4eb2-b614-ad20a1a795e8";
      fsType = "btrfs";
      options = ["subvol=persist" "compress=zstd"];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/dbd1df32-d4d5-4e20-8da7-aa8df227c6ac";
      fsType = "ext4";
      options = ["noatime" "nodiratime"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = ["subvol=home" "compress=zstd"];
    };

    "/home/daru/Music" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = ["subvol=music" "rw" "compress=zstd"];
    };

    "/home/daru/Documents" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = ["subvol=documents" "rw" "compress=zstd"];
    };

    "/home/daru/Development" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = ["subvol=repos" "rw" "compress=zstd"];
    };

    "/home/daru/Pictures" = {
      device = "/dev/disk/by-uuid/5bbf8784-92a9-4959-97a5-a7baec021d1c";
      fsType = "btrfs";
      options = ["subvol=pictures" "rw" "compress=zstd"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/7ED4-6E7F";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
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
