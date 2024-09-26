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
          owner = "felipealfonsog";
          repo = "rtl-88x2bu";
          rev = "70b9a417db1fe49ab6240252cc61073c9601bc58";
          hash = "sha256-ltyBcotI9I5295z6s2u9PLpYAyYpMQKZSKrkpeczI84=";
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
