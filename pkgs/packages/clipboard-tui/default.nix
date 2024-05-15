{
  foot,
  writeShellApplication,
  formats,
  clipse,
  toybox,
}: let
  iniFormat = formats.ini {};
  foot-config = iniFormat.generate "foot.ini" {
    main.font = "JetbrainsMono Nerd Font:size=14";
  };
in
  writeShellApplication {
    name = "clipboard-tui";
    runtimeInputs = [foot clipse toybox];
    text = ''
      if [[ ! $(pgrep -f clipboard-tui) ]]
      then
        foot -c ${foot-config} --title clipboard-tui -e clipse
      else
        pkill -f clipboard-tui
      fi
    '';
  }
