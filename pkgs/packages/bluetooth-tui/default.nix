{
  foot,
  writeShellApplication,
  formats,
  bluetuith,
}: let
  iniFormat = formats.ini {};
  foot-config = iniFormat.generate "foot.ini" {
    main.font = "JetbrainsMono Nerd Font:size=14";
  };
in
  writeShellApplication {
    name = "bluetooth-tui";
    runtimeInputs = [foot bluetuith];
    text = ''foot -c ${foot-config} --app-id tui --title bluetooth-tui -e bluetuith'';
  }
