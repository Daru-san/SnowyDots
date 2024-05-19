{
  systemd = {
    extraConfig = ''
      DefaultCPUAccounting=yes
      DefaultMemoryAccounting=yes
      DefaultIOAccounting=yes
    '';
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
