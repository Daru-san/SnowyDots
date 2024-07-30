{
  config,
  inputs,
  ...
}: {
  boot = {
    extraModulePackages = [
      (config.boot.kernelPackages.rtl88x2bu.overrideAttrs (oldAttrs: {
        src = inputs.rtw-driver;
      }))
    ];
    blacklistedKernelModules = [
      "rtw88_usb"
      "rtw88_core"
      "rtw88_8822bu"
      "rtw88_8822b"
    ];
  };
}
