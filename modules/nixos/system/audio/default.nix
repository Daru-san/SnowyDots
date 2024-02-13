{
  config,
  lib,
  ...
}: let
  cfg = config.os.audio;
in
  with lib; {
    options.os.audio.enable = mkEnableOption "Enable audio";
    config = mkIf cfg.enable {
      sound.enable = false;
      hardware.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        audio.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        wireplumber.enable = true;
      };
      hardware.enableAllFirmware = true;
    };
  }
