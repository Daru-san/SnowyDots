{
  foot,
  writeShellApplication,
  formats,
  bluetuith,
  toybox,
}: let
  iniFormat = formats.ini {};
  foot-config = iniFormat.generate "foot.ini" {
    main.font = "JetbrainsMono Nerd Font:size=14";
  };
in
  writeShellApplication {
    name = "bluetooth-tui";
    runtimeInputs = [foot bluetuith toybox];
    text = ''
      if [[ ! $(pgrep -f bluetooth-tui) ]]
      then
        foot -c ${foot-config} --title bluetooth-tui -e bluetuith
      else
        pkill -f buetooth-tui
      fi
    '';
  }
