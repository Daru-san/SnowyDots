{
  imports = [./wlsunset.nix];
  services.wlsunset-test = {
    enable = true;
    sunrise = "05:50";
    sunset = "18:50";
    systemdTarget = "hyprland-session.target";
    gamma = 0.9;
    # latitude = 25.99;
    # longitude = 28.13;
  };
}
