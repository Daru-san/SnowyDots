{pkgs, ...}: {
  programs.mpv = {
    enable = true;

    config = {
      #Enable hardware-acceleration
      hwdec = "auto-safe";

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
