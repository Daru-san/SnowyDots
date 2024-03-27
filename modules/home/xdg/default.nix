{config, ...}: {
  xdg = {
    portal.xdgOpenUsePortal = true;
    userDirs = import ./dirs.nix {inherit config;};
    desktopEntries = import ./desktop-entries.nix {};
    mimeApps = import ./mimetypes.nix;
  };
}
