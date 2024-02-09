{
, config
, lib
, ...
}:
let
  cfg = config.os.audio;
in
with lib;
{
  options.os.audio.enable = mkEnableOption "Enable audio";
  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
