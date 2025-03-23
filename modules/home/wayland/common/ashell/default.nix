{ pkgs, outputs, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.snow-packages ];
  home.packages = [ pkgs.snow-overlay.ashell ];

  xdg.configFile.ashell = {
    target = "ashell.yml";
    source = ./ashell.yml;
  };
  systemd.user.services = {
    ashell = {
      Service.ExecStart = "${pkgs.snow-overlay.ashell}/bin/ashell";
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
