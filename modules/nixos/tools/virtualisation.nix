{
  boot.kernelModules = [ "kvm-intel" ];
  virtualisation.waydroid.enable = false;
  virtualisation.virtualbox = {
    host = {
      enable = false;
      enableHardening = false;
      addNetworkInterface = false;
      enableKvm = true;
    };
    guest = {
      enable = false;
      clipboard = true;
      seamless = true;
      dragAndDrop = true;
    };
  };
}
