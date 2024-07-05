{
  config,
  pkgs,
  ...
}: {
  boot = {
    extraModprobeConfig = ''
      options rtw_core disable_lps_deep=1 support_bf=1
      options rtw_pci disable_msi=1 disable_aspm=1
    '';
    extraModulePackages = [
      (config.boot.kernelPackages.rtw88.overrideAttrs (oldAttrs: {
        src = pkgs.fetchFromGitHub {
          owner = "lwfinger";
          repo = "rtw88";
          rev = "95983ffd7fd914b228299fcfcf1b7b51df97badc";
          hash = "sha256-fT6Yp0unvtL+DiRz5qrS4jNuCM2TdjK05wuXUro2W58=";
        };
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
