{config, ...}: {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${config.programs.hyprlock.package}/bin/hyprlock";
      }
      {
        event = "lock";
        command = "${config.programs.hyprlock.package}/bin/hyprlock";
      }
    ];
    timeouts = [
      {
        timeout = 800;
        command = "${config.programs.hyprlock.package}/bin/hyprlock";
      }
      {
        timeout = 1500;
        command = "systemctl suspend";
      }
    ];
  };
}
