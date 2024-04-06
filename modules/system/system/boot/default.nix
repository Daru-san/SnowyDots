{
  pkgs,
  config,
  ...
}: {
  boot = {
    consoleLogLevel = 0;
    kernelParams = ["quiet"];
    kernelPackages =
      if (config.system.stateVersion == "24.05")
      then pkgs.linuxPackages_cachyos
      else pkgs.linuxPackages_zen;
    loader.efi.canTouchEfiVariables = true;
    initrd.verbose = false;
    loader.grub = {
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
  };
}
