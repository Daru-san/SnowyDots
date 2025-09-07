{ pkgs, config, ... }:
{
  services.flameshot = {
    package = pkgs.flameshot.override {
      enableWlrSupport = true;
      enableMonochromeIcon = true;
    };
    settings = {
      General = {
        contrastOpacity = 188;
        filenamePattern = "Flame_%F_%H-%M";
        saveAsFileExtension = "png";
        savePath = config.xdg.userDirs.extraConfig.XDG_SCREENSHOTS_DIR;
        savePathFixed = true;
        startupLaunch = false;
        useGrimAdapter = true;
      };
    };
  };
}
