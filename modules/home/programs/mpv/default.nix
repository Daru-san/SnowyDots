{ pkgs, ... }:
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

      osd-font = "NotoMono Nerd Font";
    };
    scriptOpts = {
      osc = {
        scalewindowed = 0.8;
        hidetimeout = 300;
      };
      thumbfast = {
        hwdec = true;
        network = true;
        spawn_first = true;
        max_height = 250;
        max_width = 250;
      };
    };
    scripts = with pkgs.mpvScripts; [
      sponsorblock
      uosc
      mpv-cheatsheet
      quality-menu
      mpris
      reload
      thumbfast
    ];
  };
}
