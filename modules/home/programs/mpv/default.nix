{ pkgs, lib, ... }:
{
  programs.mpv = {
    enable = true;

    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      taskbar-progress = false;
      keep-open = "always";
      profile = "gpu-hq";
      force-window = true;
      save-position-on-quit = true;
      sid = 1;
      slang = "en";
      fs = true;
      ytdl-raw-options = "ignore-config=,sub-lang=en,write-auto-sub=";
      deband = false;
    };
    scriptOpts = {
      uosc = {
        constrols = builtins.concatStringsSep "," [
          "menu"
          "gap"
          "subtitles"
          "<has_many_audio>"
          "audio"
          "<has_many_video>"
          "video"
          "<has_many_edition>"
          "editions"
          "<stream>stream-quality"
          "gap"
          "space"
          "speed"
          "space"
          "shuffle"
          "loop-playlist"
          "loop-file"
          "gap"
          "prev"
          "items"
          "next"
          "gap"
          "fullscreen"
          "<stream>command:queue_play_next:script-message-to youtube_upnext menu?Up Next"
        ];
      };
      osc = {
        scalewindowed = 0.8;
        hidetimeout = 300;
      };
      thumbfast = {
        hwdec = false;
        network = true;
        spawn_first = true;
        max_height = 250;
        max_width = 250;
      };
    };

    extraInput = ''
      menu        script-binding uosc/menu
      mbtn_right  script-binding uosc/menu
      s           script-binding uosc/subtitles          #! Subtitles
      a           script-binding uosc/audio              #! Audio tracks
      q           script-binding uosc/stream-quality     #! Stream quality
      p           script-binding uosc/items              #! Playlist
      c           script-binding uosc/chapters           #! Chapters
      >           script-binding uosc/next               #! Navigation > Next
      <           script-binding uosc/prev               #! Navigation > Prev
      alt+>       script-binding uosc/delete-file-next   #! Navigation > Delete file & Next
      alt+<       script-binding uosc/delete-file-prev   #! Navigation > Delete file & Prev
      alt+esc     script-binding uosc/delete-file-quit   #! Navigation > Delete file & Quit
      o           script-binding uosc/open-file          #! Navigation > Open file
      u           script-message-to youtube_upnext menu     #! Youtube Recommendations
      #           set video-aspect-override "-1"         #! Utils > Aspect ratio > Default
      #           set video-aspect-override "16:9"       #! Utils > Aspect ratio > 16:9
      #           set video-aspect-override "4:3"        #! Utils > Aspect ratio > 4:3
      #           set video-aspect-override "2.35:1"     #! Utils > Aspect ratio > 2.35:1
      #           script-binding uosc/audio-device       #! Utils > Audio devices
      #           script-binding uosc/editions           #! Utils > Editions
      ctrl+s      async screenshot                       #! Utils > Screenshot
      alt+i       script-binding uosc/keybinds           #! Utils > Key bindings
      O           script-binding uosc/show-in-directory  #! Utils > Show in directory
      #           script-binding uosc/open-config-directory #! Utils > Open config directory
      #           script-binding uosc/update             #! Utils > Update uosc
      esc         quit #! Quit
    '';

    scripts = with pkgs.mpvScripts; [
      sponsorblock-minimal
      uosc
      mpv-cheatsheet
      quality-menu
      mpris
      reload
      thumbfast
      memo
      youtube-upnext
    ];
  };
}
