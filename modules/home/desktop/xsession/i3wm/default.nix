{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  imports = [
    ./binds.nix
    ./style.nix
    ./windows.nix
    ./autostart.nix
    ./workspaces.nix
  ];
  xsession.windowManager.i3 = {
    package = pkgs.i3-rounded;
    config = {
      terminal = getExe config.programs.alacritty.package;
      menu = getExe config.programs.rofi.package;
    };
  };
}
