{
  config,
  pkgs,
  ...
}: {
  xdg = {
    portal.xdgOpenUsePortal = true;
    userDirs = import ./dirs.nix {inherit config;};
    desktopEntries = import ./desktop-entries.nix {inherit pkgs;};
    mimeApps = import ./mimetypes.nix;
  };
}
