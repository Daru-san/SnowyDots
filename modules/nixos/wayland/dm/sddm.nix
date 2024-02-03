{
  pkgs
, lib
, config
, ...
}:
let
  cfg = config.wayland.sddm;
in
with lib;
{
  options.wayland.sddm = {
    enable = mkEnableOption "A greeter for KDE";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [catppuccin-sddm-corners];
    services.xserver = {
      enable = true;

      libinput.enable = true;
      displayManager = {
        sddm = {
          enable = true;
          theme = "catppuccin";
          wayland.enable = true;
        };
      };
    };
  };
}
