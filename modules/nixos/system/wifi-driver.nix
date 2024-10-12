{
  pkgs,
  config,
  ...
}:
{
  boot = {
    extraModulePackages = [
      (config.boot.kernelPackages.rtl88x2bu.overrideAttrs (oldAttrs: {
        src = pkgs.fetchFromGitHub {
          owner = "morrownr";
          repo = "88x2bu-20210702";
          rev = "3c8f59b5b05e5090e8593da1940a8d3ccac3f878";
          hash = "sha256-ELDo//qkoeJVsq9qQArfd6Jc8wb2c1b3x68t6rfLmPE=";
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
