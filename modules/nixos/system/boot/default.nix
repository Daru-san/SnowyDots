{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.os.boot;
in
  with lib; {
    options = {
      os.boot = {
        quiet = mkEnableOption "Enable quiet booting";
        systemd.enable = mkEnableOption "Enable systemd-boot";
        grub.enable = mkEnableOption "Enable grub";
      };
    };
    config = {
      boot = {
        consoleLogLevel = mkIf cfg.quiet 0;
        kernelParams = mkIf cfg.quiet ["quiet"];

        loader = mkIf cfg.enableSystemd-boot {
          systemd-boot = {
            # Enable systemd-boot
            enable = true;
            # Disable editor
            editor = false;
            # Limit configurations to 10 max
            configurationLimit = 10;
          };
          grub = mkIf cfg.grub.enable {
            enable = true;
            configurationLimit = 5;
            configurationName = "NixOS";
            default = "saved";
            efiSupport = true;
            useOSProber = true;
            timeoutStyle = "menu";
            theme = pkgs.sleek-grub-theme.override {
              withStyle = "dark";
              withBanner = "Hello, Daru";
            };
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
          kernelModules = [];
        };
        # Kernel modules
        kernelModules = mkDefault ["kvm-intel"];
      };
    };
  }
