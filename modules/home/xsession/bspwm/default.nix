{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.xsession;
in {
  home.packages = with pkgs; [dmenu xautolock polybar];
  xsession.windowManager.bspwm = mkIf cfg.enable {
    enable = true;
    rules = import ./rules.nix;
    settings = import ./settings.nix;
    monitors = {
      HDMI-0 = [
        "web"
        "docs"
        "files"
        "terminal"
        "writing"
        "VI"
        "VII"
        "IIX"
        "IX"
        "X"
      ];
    };
    alwaysResetDesktops = true;
    startupPrograms = [
      "${pkgs.picom}/bin/picom &"
      "pgrep -x sxhkd > /dev/null || sxhkd &"
      "pgrep -x polybar > /dev/null || polybar &"
    ];
  };
}
