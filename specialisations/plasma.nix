{
  pkgs,
  lib,
  ...
}: {
  system.nixos.tags = ["plasma"];
  wayland = {
    enable = true;
    kde.enable = true;
  };
}
