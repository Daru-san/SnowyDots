{
  config,
  ...
}:
{
  xdg = {
    userDirs = import ./dirs.nix { inherit config; };
    mimeApps = import ./mimetypes.nix;
    desktopEntries = import ./desktop-entries.nix;
    portal = import ./portals.nix;
  };
}
