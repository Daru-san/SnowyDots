{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.os.boot;
in
with lib;
{
  options = {
    os.boot = {
      enableSystemd-boot = mkOption {
        type = with types; bool;
        default = true;
      };
      kernelPackage = mkOption {
        type = with types; raw;
        default = pkgs.linuxPackages_zen;
      };
      quiet = mkOption {
        type = with types; bool;
        default = true;
      };
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
      kernelPackages = cfg.kernelPackage;

      initrd = mkDefault {
        verbose = false;
        availableKernelModules = [ "ahci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
        kernelModules = [ ];
      };
      # Kernel modules
      kernelModules = mkDefault [ "kvm-intel" ];
    };
  };
}
