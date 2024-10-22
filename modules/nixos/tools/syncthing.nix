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
    settings = {
      gui.theme = "black";
    };
  };
}
