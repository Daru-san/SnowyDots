{
  boot = {
    consoleLogLevel = 2;
    initrd.verbose = false;
    kernelParams = ["quiet"];
    supportedFilesystems = ["ntfs"];
    initrd.systemd.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 4;
    };
  };
}
