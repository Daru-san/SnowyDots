{...}:{
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = "~/Music";
    settings = {
      mpd_crossfade_time = 4;
      ncmpcpp_directory = "~/.ncmpcpp";
      # visualizer_type = "spectrum";
      # visualizer_fps = 60;
      # visualizer_spectrum_smooth_look = true;
      progressbar_look = "=>";
    };
  };
}
