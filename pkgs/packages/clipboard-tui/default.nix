{
  foot,
  writeShellApplication,
  formats,
  clipse,
}: let
  iniFormat = formats.ini {};
  foot-config = iniFormat.generate "foot.ini" {
    main.font = "JetbrainsMono Nerd Font:size=14";
  };
in
  writeShellApplication {
    name = "clipboard-tui";
    runtimeInputs = [foot clipse];
    text = ''foot -c ${foot-config} --title clipboard-tui -e clipse'';
  }
