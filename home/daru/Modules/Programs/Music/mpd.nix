{config, ...}:{
  services.mpd = let
    home = "${config.home.homeDirectory}";
  in {
    enable = true;
    dataDir = "${home}/.music/mpd";
    musicDirectory = "${home}/Music";
    playlistDirectory = "${home}/.music/mpd";
    dbFile = "${dataDir}/mpd.db";
    extraConfig = ''
    db_file      "~/.music/mpd/mpd.db"  
    log_file      "~/.music/mpd/mpd.log"
    pid_file      "~/.music/mpd/mpd.pid"
    state_file     "~/.music/mpd/mpdstate"   

    audio_output {
      type            "pipewire"
      name            "Music"
    }
    audio_output {
      type                    "fifo"
      name                    "my_fifo"
      path                    "/tmp/mpd.fifo"
      format                  "44100:16:2"
    }
    '';
  };
}
