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
    user.extraConfig = ''
      DefaultCPUAccounting=yes
      DefaultMemoryAccounting=yes
      DefaultIOAccounting=yes
    '';
    services."user@".serviceConfig.Delegate = true;
  };
  systemd.services.nix-daemon = {
    serviceConfig = {
      CPUWeight = 20;
      MemoryHigh = "3G";
      MemoryMax = "4G";
      IOWeight = 20;
    };
  };
}
