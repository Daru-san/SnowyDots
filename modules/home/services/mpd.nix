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

          audio_output {
            type "fifo"
            name "rmpc-fifo"
            path "/tmp/mpd.fifo"
            format "44100:16:2"
          }
        '';
    };
    mpdscribble = {
      enable = true;
      endpoints = {
        "last.fm" = {
          username = "Lunaritzol";
          passwordFile = "${config.xdg.userDirs.extraConfig.XDG_SECRET_DIR}/scribble";
        };
      };
    };
    mpd-mpris = {
      enable = true;
      mpd.useLocal = true;
    };
  };
}
