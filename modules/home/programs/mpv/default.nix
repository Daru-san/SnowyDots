{pkgs, ...}: {
  programs.mpv = {
    enable = true;

    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      taskbar-progress = false;
      keep-open = "always";
      # profile = "gpu-hq";
      force-window = true;
      save-position-on-quit = true;
      deband = false;
      osd-bar = false;
      border = false;
      osc = false;
      osd-font = "NotoMono Nerd Font";
      sub-auto = "fuzzy";
    };
    scriptOpts = {
      osc = {
        scalewindowed = 0.8;
        hidetimeout = 300;
        showonpause = false;
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
      quack
      mpris
      thumbfast
    ];
  };
}
