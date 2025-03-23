{ pkgs, ... }:

{
  home.packages = [ pkgs.snow.ashell ];

  xdg.configFile.ashell = {
    target = "ashell.yml";
    source = ./ashell.yml;
  };
  systemd.user.services = {
    ashell = {
      Service.ExecStart = "${pkgs.snow.ashell}/bin/ashell";
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
