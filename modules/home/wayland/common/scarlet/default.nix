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
    extraConfig = ./config.kdl;
    settings = import ./settings.nix;
    systemd = {
      enable = true;
      styles-watch-directory = "${config.xdg.configHome}/scarlet";
    };
  };
}
