{
  boot.kernelModules = ["kvm-intel"];
  virtualisation.waydroid.enable = true;
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableHardening = false;
      addNetworkInterface = false;
      enableKvm = true;
    };
    guest = {
      enable = true;
      clipboard = true;
      seamless = true;
      dragAndDrop = true;
    };
  };
}
