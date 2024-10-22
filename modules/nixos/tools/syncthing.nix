{
  services.syncthing = {
    enable = true;
    dataDir = "/home/daru";
    user = "daru";
    configDir = "/home/daru/.sync";
    overrideDevices = false;
    overrideFolders = false;
    openDefaultPorts = true;
    relay.enable = true;
    systemService = false;
    settings = {
      gui.theme = "black";
    };
  };
}
