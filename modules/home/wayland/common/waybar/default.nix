{
  config,
  lib,
  ...
}:
{
  stylix.targets.waybar = {
    addCss = false;
    font = "serif";
  };

  programs.waybar = {
    systemd.enable = true;

    settings = import ./setup.nix { inherit config lib; };

    style = (builtins.readFile ./style.css);
  };
}
