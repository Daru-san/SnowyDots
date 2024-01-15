{ 
  config, 
  lib, 
  pkgs, 
  modulesPath,
  ...
}:
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")];

  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/186fce87-42a0-4b38-8222-f3fe8661cf9f";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/etc" =
    { device = "/dev/disk/by-uuid/186fce87-42a0-4b38-8222-f3fe8661cf9f";
      fsType = "btrfs";
      options = [ "subvol=etc" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/186fce87-42a0-4b38-8222-f3fe8661cf9f";
      fsType = "btrfs";
      options = [ "subvol=log" ];
    };

  fileSystems."/root" =
    { device = "/dev/disk/by-uuid/186fce87-42a0-4b38-8222-f3fe8661cf9f";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/186fce87-42a0-4b38-8222-f3fe8661cf9f";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/186fce87-42a0-4b38-8222-f3fe8661cf9f";
      fsType = "btrfs";
      options = [ "subvol=tmp" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D04A-9AA9";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/78d797f0-5db6-4f7c-8030-685e2e381935"; }
    ];


  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
