{config, ...}: {
  xdg = {
    portal.xdgOpenUsePortal = true;
    userDirs = import ./dirs.nix {inherit config;};
    mimeApps = import ./mimetypes.nix;
    desktopEntries = import ./desktop-entries.nix;
  };
}
