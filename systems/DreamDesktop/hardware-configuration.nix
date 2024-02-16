{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/frost";
    fsType = "ext4";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/snow";
    fsType = "ext4";
  };

  swapDevices = [{device = "/dev/disk/by-label/Melt";}];

  networking.useDHCP = with lib; mkDefault true;
  nixpkgs.hostPlatform = with lib; mkDefault "x86_64-linux";
}
