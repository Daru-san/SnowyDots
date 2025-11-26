{
  inputs,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
  ];
  programs.dankMaterialShell = {
    systemd.enable = true;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = false;
    enableBrightnessControl = false;
    enableColorPicker = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = false;
    enableSystemSound = true;

    default.settings = {
      theme = "dark";
      dynamicTheming = true;
    };
  };
}
