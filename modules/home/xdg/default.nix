{
  config,
  pkgs,
  ...
}: {
  xdg = {
    portal.xdgOpenUsePortal = true;
    userDirs = import ./dirs.nix {inherit config;};
    mimeApps = import ./mimetypes.nix;
  };
}
