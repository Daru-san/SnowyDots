{
  nix = {
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";
  };
  systemd = {
    settings.Manager = {
      DefaultCPUAccounting = true;
      DefaultMemoryAccounting = true;
      DefaultIOAccounting = true;
    };
    services."user@".serviceConfig.Delegate = true;
  };
  systemd.services.nix-daemon = {
    serviceConfig = {
      CPUWeight = 50;
      MemoryHigh = "3G";
      MemoryMax = "4G";
      IOWeight = 50;
    };
  };
}
