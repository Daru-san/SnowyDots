{
  pkgs,
  config,
  ...
}: {
  boot = {
    consoleLogLevel = 0;
    kernelParams = ["quiet"];
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelModules = ["cpupower" "turbostat"];
    extraModulePackages = with config.boot.kernelPackages; [turbostat cpupower];
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
    plymouth = {
      enable = true;
      theme = "loader";
      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = ["loader"];
        })
      ];
    };
    initrd.systemd.enable = true;
  };
  chaotic.scx = {
    enable = true;
    scheduler = "scx_rustland";
  };
}
