# System76 tools
{...}:{
  # System76 power daemon
  hardware.system76.power-daemon.enable = true;
  
  # System76 scheduler
  services.system76-scheduler = {
    enable = true;
    useStockConfig = true;
  };
}
