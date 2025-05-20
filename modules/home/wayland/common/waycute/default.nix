{
  pkgs,
  inputs,
  system,
  lib,
  ...
}:
let
  waycute = inputs.waycute.packages.${system}.waycute;
in
{
  home.packages =
    [
      waycute
    ]
    ++ (with pkgs.qt6; [
      qtdeclarative
    ]);

  systemd.user.services.snowy-shell = {
    Unit = {
      Description = "A wayland shell";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session-pre.target" ];
    };

    Service = {
      ExecStart = lib.getExe waycute;
      Restart = "on-failure";
      KillMode = "mixed";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
