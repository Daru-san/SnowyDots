#Hardware configuration
{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=log" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5BC9-5E1D";
      fsType = "vfat";
    };

  #swap
  swapDevices = [  
    {
      device = "/var/lib/swapfile";
      size = 3072;
      # swappiness = 7;
    }
  ];

  # System kind
  nixpkgs.hostPlatform = "x86_64-linux";
}
