{
  foot,
  writeShellApplication,
  formats,
  networkmanager,
}: let
  iniFormat = formats.ini {};
  foot-config = iniFormat.generate "foot.ini" {
    main.font = "JetbrainsMono Nerd Font:size=14";
  };
in
  writeShellApplication {
    name = "network-tui";
    runtimeInputs = [foot networkmanager];
    text = ''foot -c ${foot-config} --app-id tui --title network-tui -e nmtui'';
  }
