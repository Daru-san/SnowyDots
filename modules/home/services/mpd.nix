{ config, ... }:
let
  cfg = config.services.mpd;
in
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

  programs.rmpc = {
    enable = true;
    config = # ron
      ''
        (
            address: "${cfg.network.listenAddress}:${toString cfg.network.port}",
            password: None,
            theme: None,
            cache_dir: None,
            on_song_change: None,
            volume_step: 5,
            max_fps: 30,
            scrolloff: 0,
            wrap_navigation: false,
            enable_mouse: true,
            enable_config_hot_reload: true,
            select_current_song_on_change: false,
            browser_song_sort: [Disc, Track, Artist, Title],
        )
      '';
  };
}
