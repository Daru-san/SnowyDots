{pkgs, ...}: {
  boot = {
    consoleLogLevel = 0;
    kernelParams = ["quiet"];
    kernelPackages = pkgs.linuxPackages_xanmod_stable;
    initrd.verbose = false;
    initrd.systemd.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 7;
    };
  };
}
