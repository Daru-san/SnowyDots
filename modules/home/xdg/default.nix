{
  config,
  pkgs,
  ...
}:
{
  xdg = {
    userDirs = import ./dirs.nix { inherit config; };
    mimeApps = import ./mimetypes.nix;
    desktopEntries = import ./desktop-entries.nix;
    portal = import ./portal.nix { inherit pkgs; };
  };
}
