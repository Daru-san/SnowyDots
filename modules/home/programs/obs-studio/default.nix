{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vaapi
      obs-gstreamer
      obs-mute-filter
      obs-source-record
      obs-source-switcher
      obs-pipewire-audio-capture
    ];
  };
}
