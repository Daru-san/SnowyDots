{...}:{
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir - "~/Music/";
    settings = {
      mpd_crossfade_time = 0.4;
      ncmpcpp_directory = "~/.local/share/ncmpcpp";
      visualizer_type = "spectrum";
      visualizer_fps = 60;
      visualizer_spectrum_smooth_look = true;
    };
  };
}
