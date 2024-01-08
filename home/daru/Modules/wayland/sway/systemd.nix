{...}:{
  # systemd targets for systemd dependant services
  services = {
    kanshi.systemdTarget = "sway-session.target";
    copyq.systemdTarget = "sway-session.target";
    swayidle.systemdTarget = "sway-session.target";
  };
}
