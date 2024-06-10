{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vaapi
      obs-vkcapture
      obs-gstreamer
      obs-source-record
      obs-source-switcher
      obs-pipewire-audio-capture
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
}
