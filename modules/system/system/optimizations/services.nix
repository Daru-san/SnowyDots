{
  systemd.services.nix-daemon.serviceConfig = {
    CPUWeight = 20;
    IOWeight = 20;
  };
}
