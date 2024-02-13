{ pkgs, config, lib, ... }:
let cfg = config.os.boot;
in with lib; {
  options = {
    os.boot = {
      enableSystemd-boot = mkEnableOption "Enable systemd boot";
      quiet = mkEnableOption "Enable quiet booting";
    };
  };
  config = {
    boot = {
      consoleLogLevel = mkIf cfg.quiet 0;
      kernelParams = mkIf cfg.quiet [ "quiet" ];

      loader = mkIf cfg.enableSystemd-boot {
        systemd-boot = {
          # Enable systemd-boot
          enable = true;
          # Disable editor
          editor = false;
          # Limit configurations to 10 max
          configurationLimit = 10;
        };
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_zen;

      initrd = mkDefault {
        verbose = false;
        availableKernelModules = [
          "ahci"
          "xhci_pci"
          "usb_storage"
          "usbhid"
          "sd_mod"
          "rtsx_pci_sdmmc"
        ];
        kernelModules = [ ];
      };
      # Kernel modules
      kernelModules = mkDefault [ "kvm-intel" ];
    };
  };
}
