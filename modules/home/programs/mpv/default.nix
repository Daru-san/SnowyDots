{pkgs, ...}: {
  programs.mpv = {
    enable = true;

    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
      gpu-context = "wayland";
      force-window = true;
    };

    scripts = with pkgs.mpvScripts; [
      sponsorblock
      convert
      uosc
      quality-menu
      mpris
      autocrop
      thumbfast
    ];
  };
}
