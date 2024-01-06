{...}:{
  services.mpd = {
    enable = true;
    dataDir = .music/mpd;
    musicDirectory = "~/Music";
    playlistDirectory = .music/mpd/playlists;
    extraConfig = ''
    db_file      "~/.music/mpd/mpd.db"  
    log_file      "~/.music/mpd/mpd.log"
    pid_file      "~/.music/mpd/mpd.pid"
    state_file     "~/.music/mpd/mpdstate"   

    audio_output {
      type            "pulse"
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
