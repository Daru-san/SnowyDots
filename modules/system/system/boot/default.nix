{pkgs, ...}: {
  boot = {
    consoleLogLevel = 1;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["quiet"];
    initrd.verbose = false;
    initrd.systemd.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 4;
    };
  };
}
