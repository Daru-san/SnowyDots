{config, ...}: {
  boot = {
    extraModulePackages = [config.boot.kernelPackages.rtl88x2bu];
    kernelModules = ["88x2bu"];
    blacklistedKernelModules = [
      "rtw88_usb"
      "rtw88_core"
      "rtw88_8822bu"
      "rtw88_8822b"
    ];
  };
}
