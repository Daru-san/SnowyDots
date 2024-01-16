{...}:{
  # systemd targets for systemd dependant services
  services = {
    kanshi.systemdTarget = "hyprland-session.target";
    copyq.systemdTarget = "hyprland-session.target";
    swayidle.systemdTarget = "hyprland-session.target";
  };
}
