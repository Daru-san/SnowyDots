{
  config,
  lib,
  ...
}: 
let
  cfg = config.os.security.polkit;
in 
with lib;
{
  options = {
    os.security.polkit.enable = mkOption {
      default = false;
      type = with types; bool;
    };
  };
  config =  mkIf cfg.enable {
    security.polkit.enable = true;
    security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (
          subject.isInGroup("users")
            && (
              action.id == "org.freedesktop.login1.reboot" ||
              action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
              action.id == "org.freedesktop.login1.power-off" ||
              action.id == "org.freedesktop.login1.power-off-multiple-sessions"
            )
          )
        {
          return polkit.Result.YES;
        }
      })
  '';
  };
}
