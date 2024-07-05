{
  services.syncthing = {
    enable = true;
    dataDir = "/home/daru";
    user = "daru";
    configDir = "/home/daru/.sync";
    overrideDevices = false;
    overrideFolders = false;
    openDefaultPorts = true;
    settings = {
      gui.theme = "black";
    };
  };
}
