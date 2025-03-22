{
  config,
  pkgs,
  ...
}:
{
  xdg = {
    userDirs = import ./dirs.nix { inherit config; };
    mime.enable = true;
    mimeApps = {
      enable = true;
    } // import ./mimetypes.nix;
    desktopEntries = import ./desktop-entries.nix;
    portal = import ./portal.nix { inherit pkgs; };
  };
}
