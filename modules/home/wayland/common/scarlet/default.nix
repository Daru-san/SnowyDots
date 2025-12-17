{ inputs, config, ... }:
{
  imports = [
    inputs.scarlet.homeModules.default
  ];

  programs.scarlet = {
    config = ./config.kdl;
    systemd = {
      enable = true;
      styles-watch-directory = "${config.xdg.configHome}/scarlet";
    };
  };
}
