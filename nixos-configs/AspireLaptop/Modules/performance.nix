{...}:{
  #Enable throttled service
  services.throttled.enable = true;

  #Enable tlp for power management
  services.tlp.enable = true;

  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
  '';
}
