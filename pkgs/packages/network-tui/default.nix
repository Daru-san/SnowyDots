{
  foot,
  writeShellApplication,
  formats,
  networkmanager,
  toybox,
}: let
  iniFormat = formats.ini {};
  foot-config = iniFormat.generate "foot.ini" {
    main.font = "JetbrainsMono Nerd Font:size=14";
  };
in
  writeShellApplication {
    name = "network-tui";
    runtimeInputs = [foot networkmanager toybox];
    text = ''
      if [[ ! $(pgrep -f network-tui) ]]
      then
        foot -c ${foot-config} --title network-tui -e nmtui
      else
        pkill -f network-tui
      fi
    '';
  }
