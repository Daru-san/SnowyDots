{
  config,
  pkgs,
  system,
  inputs,
  ...
}: {
  xdg = {
    portal = import ./portal.nix {inherit pkgs system inputs;};
    userDirs = import ./dirs.nix {inherit config;};
    mimeApps = import ./mimetypes.nix;
    desktopEntries = import ./desktop-entries.nix;
  };
}
