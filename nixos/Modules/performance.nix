{...}:{
  #Enable throttled service
  services.throttled.enable = true;

  #System76 power daemon
  hardware.system76.power-daemon.enable = true;
  #Enable tlp for power management
  services.tlp.enable = true;
  #
  # #Disable power-profiles-daemon for GNOME (if enabled)
  services.power-profiles-daemon.enable = false;

  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
  '';
}
