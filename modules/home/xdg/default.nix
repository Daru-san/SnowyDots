{
  xdg = {
    portal.xdgOpenUsePortal = true;
    userDirs = import ./dirs.nix;
    desktopEntries = import ./desktop-entries.nix;
    mimeApps = import ./mimetypes.nix;
  };
}
