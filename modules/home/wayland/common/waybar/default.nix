{
  config,
  lib,
  ...
}:
let
in
{
  stylix.targets.waybar.addCss = false;

  programs.waybar = {
    enable = true;

    systemd.enable = true;

    settings = import ./setup.nix { inherit config lib; };

    style = (builtins.readFile ./style.css);
  };
}
