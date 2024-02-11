{pkgs, lib,config, ...}:
with lib;
{
  home.packages = with pkgs; [ cliphist wl-clipboard ];
  systemd.user.services.cliphist = {
    Unit = {
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session-pre.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.wl-paste} --watch ${pkgs.cliphist} store";
      Restart = "on-failure";
    };

    Install.WantedBy = [
      (mkIf (config.wayland.compositor == "hyprland") "hyprland-session.target" )
      (mkIf (config.wayland.compositor == "sway") "sway-session.target")
    ];
  };
}
