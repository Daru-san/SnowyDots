{pkgs, ...}:{
  services = {
    syncthing = {
      enable = true;
      tray = {
        enable = true;
        command = "stc-tray";
        package = pkgs.syncthingtray;
      };
    };
  };
}
