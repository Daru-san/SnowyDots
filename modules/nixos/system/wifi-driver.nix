{
  config,
  pkgs,
  ...
}: {
  boot = {
    extraModprobeConfig = ''
      options 88x2bu rtw_power_mgnt=0
    '';
    extraModulePackages = [
      (config.boot.kernelPackages.rtl88x2bu.overrideAttrs
        (oldAttrs: {
          src = pkgs.fetchFromGitHub {
            owner = "cilynx";
            repo = "rtl88x2bu";
            rev = "620b1a12c8822ee7d340465fbdc9d5150b193189";
            hash = "sha256-InpU6HFoa1vPzP88HdQo76i1s6zAHPQ05pzGiaQKgEw=";
          };
        }))
    ];
    kernelModules = ["88x2bu"];
    blacklistedKernelModules = [
      "rtw88_usb"
      "rtw88_core"
      "rtw88_8822bu"
      "rtw88_8822b"
    ];
  };
}
