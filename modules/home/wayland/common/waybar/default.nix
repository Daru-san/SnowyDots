{
  config,
  lib,
  ...
}:
{
  stylix.targets.waybar.addCss = false;

  programs.waybar = {
    systemd.enable = false;

    settings = import ./setup.nix { inherit config lib; };

    style = (builtins.readFile ./style.css);
  };
}
