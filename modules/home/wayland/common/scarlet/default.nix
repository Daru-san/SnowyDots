{ inputs, config, ... }:
let
  styles = ./styles;
in
{
  imports = [
    inputs.scarlet.homeModules.default
  ];

  programs.scarlet = {
    config = ./config.kdl;
    style = "${styles}/style.scss";
    systemd = {
      enable = true;
      styles-watch-directory = "${config.xdg.configHome}/scarlet";
    };
  };
}
