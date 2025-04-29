{
  config,
  pkgs,
  lib,
  ...
}:
{
  xdg = {
    userDirs = import ./dirs.nix { inherit config; };
    mime.enable = true;
    mimeApps = {
      enable = true;
    } // import ./mimetypes.nix {inherit lib; };
    desktopEntries = import ./desktop-entries.nix;
    portal = import ./portal.nix { inherit pkgs; };
  };
}
