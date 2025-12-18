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
    settings = {
      popups = {
        notifications = {
          enable = true;
          timeout = 3000;
          anchors = [ "top" ];
          layer = "overlay";
        };

        osd = {
          enable = true;
          timeout = 2000;

          layer = "overlay";

          orientation = "horizontal";

          margins = {
            bottom = 80;
            top = 10;
            left = 12;
            right = 13;
          };

          anchors = [ "bottom" ];
        };
      };
    };
    systemd = {
      enable = true;
      styles-watch-directory = "${config.xdg.configHome}/scarlet";
    };
  };
}
