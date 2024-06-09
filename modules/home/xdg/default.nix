{
  config,
  pkgs,
  ...
}: {
  xdg = {
    portal = import ./portal.nix {inherit pkgs;};
    userDirs = import ./dirs.nix {inherit config;};
    mimeApps = import ./mimetypes.nix;
    desktopEntries = import ./desktop-entries.nix;
  };
}
