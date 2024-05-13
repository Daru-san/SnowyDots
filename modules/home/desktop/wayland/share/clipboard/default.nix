{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe;
  inherit (pkgs) writeShellScriptBin formats;
  foot = getExe pkgs.foot;
  clipse = getExe pkgs.clipse;
  iniFormat = formats.ini {};
  foot-config = iniFormat.generate "foot.ini" {
    main.font = "JetbrainsMono Nerd Font:size=14";
  };
in {
  home.packages = [
    (writeShellScriptBin "clipse-manager" ''
      if [[ ! $(pgrep -f tui-clipboard) ]]
      then
        ${foot} -c ${foot-config} --title tui-clipboard -e ${clipse}
      else
        pkill -f tui-clipboard
      fi
    '')
  ];
}
