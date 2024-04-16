{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.os.boot;
in {
  options = {
    os.boot = {
      enableEfiGrub = mkEnableOption "Enable the grub config for EFI";
    };
  };
  config.boot = mkMerge [
    {
      consoleLogLevel = 0;
      kernelParams = ["quiet"];
      kernelPackages = pkgs.unstable.linuxPackages_zen;
      initrd.verbose = false;
      loader.grub = {
        enable = true;
        configurationLimit = 3;
        default = "saved";
        useOSProber = true;
        timeoutStyle = "menu";
      };
      plymouth = rec {
        enable = true;
        theme = "blockchain";
        themePackages = [
          (pkgs.adi1090x-plymouth-themes.override {
            selected_themes = [theme];
          })
        ];
      };
      initrd.systemd.enable = true;
    }
    (mkIf cfg.enableEfiGrub {
      loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          device = "nodev";
          theme = pkgs.sleek-grub-theme.override {
            withStyle = "dark";
            withBanner = "Hello, Daru";
          };
          efiSupport = true;
        };
      };
    })
  ];
}
