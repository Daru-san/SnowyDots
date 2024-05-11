{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) getExe;
  inherit (pkgs) writeShellScriptBin;
  foot = getExe config.programs.foot.package;
  clipse = getExe pkgs.clipse;
in {
  programs.foot = {
    enable = true;
    settings = {
      main.font = "JetbrainsMono Nerd Font:size=14";
    };
  };
  systemd.user.services.clipse = {
    Unit = {
      Description = "Clipse clipboard manager";
      After = ["graphical-session-pre.target"];
      PartOf = ["graphical-session.target"];
    };
    Install.WantedBy = ["graphical-session.target"];
    Service = {
      ExecStart = "${clipse} --listen";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
  home.packages = [
    (writeShellScriptBin "clipse-manager" ''
      if [[ ! $(pgrep -f tui-clipboard) ]]
      then
        ${foot} --title tui-clipboard -e ${clipse}
      else
        pkill -f tui-clipboard
      fi
    '')
  ];
}
