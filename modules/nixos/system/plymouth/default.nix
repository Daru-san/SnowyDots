{
  pkgs,
  config,
  lib,
  ...
}:let
  cfg = config.os.boot.plymouth;
in 
with lib;
{
  options = {
    os.boot.plymouth = {
      enable = mkOption {
        type = with types; bool;
        default = false;
        example = true;
        description = ''
          Enable plymouth with custom themes
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    boot = {
      plymouth = {
        enable = true;
        theme = "spinner_alt";
        themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["spinner_alt"];})];
      };
      initrd = {
        systemd = {
          enable = true;
          dbus = {
            enable = true;
          };
        };
      };
    };
  };
}
