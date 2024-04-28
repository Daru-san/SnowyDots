{
  pkgs,
  config,
  lib,
  ...
}: {
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
      terminal = lib.getExe config.programs.alacritty.package;
      menu = lib.getExe config.programs.rofi.package;
    };
  };
}
