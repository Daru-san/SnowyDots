{ inputs, config, ... }:
{
  imports = [
    inputs.scarlet.homeModules.default
  ];

  xdg.configFile."scarlet" = {
    source = ./styles;
    recursive = true;
  };
  programs.scarlet = {
    config = ./config.kdl;
    systemd = {
      enable = true;
      styles-watch-directory = "${config.xdg.configHome}/scarlet";
    };
  };
}
