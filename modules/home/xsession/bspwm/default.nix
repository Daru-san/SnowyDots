{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.xsession;
in {
  home.packages = with pkgs; [dmenu xautolock];
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
      "${pkgs.picom}/bin/picom"
    ];
  };
}
