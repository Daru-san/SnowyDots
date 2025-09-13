{ pkgs, ... }:
{
  boot = {
    consoleLogLevel = 2;
    initrd.verbose = false;
    kernelParams = [ "quiet" ];
    supportedFilesystems = {
      ntfs = true;
    };
    initrd.systemd.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 7;
      consoleMode = "auto";
      memtest86.enable = true;
    };
    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };
  };
}
