{ config, ... }:
{
  services = {
    mpd = {
      enable = true;
      musicDirectory = config.xdg.userDirs.music;
      network = {
        startWhenNeeded = true;
        port = 6600;
        listenAddress = "127.0.0.1";
      };
      extraConfig = # conf
        ''
          audio_output {
              type    "pipewire"
              name    "PipeWire Sound Server"
          }
        '';
    };
    mpd-mpris = {
      enable = true;
      mpd.useLocal = true;
    };
  };
}
