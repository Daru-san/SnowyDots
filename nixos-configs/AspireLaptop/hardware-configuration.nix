{ config, lib, pkgs, modulesPath, ... }:
let
  impermanence = builtins.fetchTarball "https://github.com/nix-community/impermanence/archive/master.tar.gz";
in
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
	    "${impermanence}/nixos.nix"
    ];
  #Root on tmpfs 
  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
    };


  #Boot
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5BC9-5E1D";
      fsType = "vfat";
    };

  #Persisted directories mounted as btrfs subvolumes
  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/6e78ed62-ceaa-460d-9966-5a5114ff11fa";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };
  #Encryption
  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/e7ddebc8-055e-4477-b02f-aa509be37fa2";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/6e78ed62-ceaa-460d-9966-5a5114ff11fa";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/6e78ed62-ceaa-460d-9966-5a5114ff11fa";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
      neededForBoot = true;
    };

  fileSystems."/etc/nixos" =
    { device = "/dev/disk/by-uuid/6e78ed62-ceaa-460d-9966-5a5114ff11fa";
      fsType = "btrfs";
      options = [ "subvol=nixos-config" ];
    };
  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/6e78ed62-ceaa-460d-9966-5a5114ff11fa";
      fsType = "btrfs";
      options = [ "subvol=tmp" ];
    };

  #Swap file
  swapDevices = [
  {
   device = "/var/lib/swapfile";
   size = 2048;
   }
  ];


  #Directories and files persisted by Nix
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  environment.persistence."/persist" = {
    directories = [
      "/etc/ssh"
      "/etc/NetworkManager"	
      "/var/log"
      "/var/tmp"
      
      "/var/lib"
      "/var/db/sudo/lectured"
    ];
   files = [
     "/etc/machine-id"
     "/etc/nix/id_rsa"
     # "/etc/passwd"
     # "/etc/shadow"
    ];
 };
}