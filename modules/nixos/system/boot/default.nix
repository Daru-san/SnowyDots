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

        loader = {
          systemd-boot = mkIf cfg.systemd.enable {
            # Enable systemd-boot
            enable = true;
            # Disable editor
            editor = false;
            # Limit configurations to 10 max
            configurationLimit = 10;
          };
          grub = mkIf cfg.grub.enable {
            enable = true;
            configurationLimit = 3;
            default = "saved";
            device = "nodev";
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

        initrd.verbose = false;
        # Kernel modules
        kernelModules = ["kvm-intel"];
      };
    };
  }
