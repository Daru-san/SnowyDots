{
  services.syncthing = {
    enable = true;
    dataDir = "/home/daru";
    user = "daru";
    configDir = "/home/daru/.local/state/syncthing";
    overrideDevices = false;
    overrideFolders = false;
    openDefaultPorts = true;
    extraFlags = [ "--no-default-folder" ];
    relay.enable = true;
    systemService = false;
    guiAddress = "0.0.0.0:8385";
    settings = {
      gui.theme = "black";
    };
  };
}
