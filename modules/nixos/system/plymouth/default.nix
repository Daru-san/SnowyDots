{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.os.boot.plymouth;
in
  with lib; {
    options.os.boot.plymouth.enable =
      mkEnableOption "Enable plymouth with custom themes";
    config.boot = mkIf cfg.enable {
      plymouth = {
        enable = true;
        theme = "loader";
        themePackages = [
          (pkgs.adi1090x-plymouth-themes.override {
            selected_themes = ["loader"];
          })
        ];
      };
      initrd.systemd.enable = true;
    };
  }
