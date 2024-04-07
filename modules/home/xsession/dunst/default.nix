{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.xsession;
in {
  services.dunst = mkIf cfg.enable {
    enable = true;
    iconTheme = {inherit (config.gtk.iconTheme) name package;};
  };
}
