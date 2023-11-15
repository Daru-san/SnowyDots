{...}:{
  #Enable throttled service
  services.throttled.enable = true;

  #Enable tlp for power management
  services.tlp.enable = true;

  #Disable power-profiles-daemon for GNOME (if enabled)
  services.power-profiles-daemon.enable = false;

  #Set performance to max
  powerManagement = {
  	enable = true;
	  cpuFreqGovernor = "performance";

    #Enable powertop for system monitoring
    powertop = {
      enable = true;
    };
  };
}
