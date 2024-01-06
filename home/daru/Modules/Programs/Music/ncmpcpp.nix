{...}:{
  imports = [ ./mpd.nix ];
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = "~/Music/";
    settings = {
      ncmpcpp_directory = "~/.music/ncmpcpp";
      lyrics_directory = "~/.music/ncmpcpp/lyrics";
      external_editor = "nvim";
      message_delay_time = 1;
      playlist_disable_highlight_delay = 2;
      autocenter_mode                  = "yes";
      centered_cursor                  = "yes";
      ignore_leading_the               = "yes";
      allow_for_physical_item_deletion = "no";
      lines_scrolled = "1";
      follow_now_playing_lyrics = "yes";

      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "mpd_visualizer";
      visualizer_type        = "ellipse";
      visualizer_look       = "●●"; 
      visualizer_color      = "46, 10, 5";

      colors_enabled        = "yes";
      playlist_display_mode = "classic";
      user_interface        = "classic";
      volume_color          = "white";

      song_window_title_format = "music";
      statusbar_visibility     = "yes";
      header_visibility        = "yes";
      titles_visibility        = "yes";

      progressbar_look = "===";
      progressbar_color = "black";
      progressbar_elapsed_color = "yellow";

      song_status_format= "$5%t";
      song_list_format = "$(254)%t$R  $(256)$5  %l$8";
      song_columns_list_format = "(53)[blue]{tr} (45)[blue]{a}";

      current_item_prefix = "$b$2| ";
      current_item_suffix = "$/b$5";

      now_playing_prefix = "$b$5 | ";
      now_playing_suffix = "$/b$5";

      song_library_format = "{{%a - %t} (%b)}|{%f}";

      main_window_color = "white";

      current_item_inactive_column_prefix = "red";
      current_item_inactive_column_suffix = "red";

      color1 = "white"; 
      color2 = "blue";
    };
  };
}
