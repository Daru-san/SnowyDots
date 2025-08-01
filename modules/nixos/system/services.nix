{
  systemd = {
    settings.Manager = {
      DefaultCPUAccounting=true;
      DefaultMemoryAccounting=true;
      DefaultIOAccounting=true;
    };
    user.extraConfig = ''
      DefaultCPUAccounting=yes
      DefaultMemoryAccounting=yes
      DefaultIOAccounting=yes
    '';
    services."user@".serviceConfig.Delegate = true;
  };
  systemd.services.nix-daemon.serviceConfig = {
    CPUWeight = 20;
    IOWeight = 20;
  };
}
