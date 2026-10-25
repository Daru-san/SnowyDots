{
  boot = {
    consoleLogLevel = 2;
    kernelParams = [ "quiet" ];
    supportedFilesystems = {
      ntfs = true;
    };
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 7;
      consoleMode = "auto";
      memtest86.enable = true;
    };
    plymouth.enable = false;
  };
}
