{ inputs, config, ... }:
{
  imports = [
    inputs.scarlet.homeModules.default
  ];

  programs.scarlet = {
    enable = true;
    config = ./config.kdl;
    systemd = {
      enable = true;
      styles-watch-directory = "${config.xdg.configHome}/scarlet";
    };
  };
}
