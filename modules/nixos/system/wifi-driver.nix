{
  config,
  inputs,
  ...
}: {
  boot = {
    extraModprobeConfig = ''
      options rtw_core disable_lps_deep=y support_bf=y
      options rtw88_core disable_lps_deep=y
      options rtw_pci disable_msi=y disable_aspm=y
    '';
    extraModulePackages = [
      (config.boot.kernelPackages.rtw88.overrideAttrs (oldAttrs: {
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
