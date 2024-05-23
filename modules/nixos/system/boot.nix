{
  boot = {
    consoleLogLevel = 1;
    kernelParams = ["quiet"];
    initrd.verbose = false;
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
