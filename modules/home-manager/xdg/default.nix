# Settings folders that will be present everytime the config is built
{...}: {
  imports = [./mimetypes.nix ./dirs.nix];
  xdg.portal.xdgOpenUsePortal = true;
}
