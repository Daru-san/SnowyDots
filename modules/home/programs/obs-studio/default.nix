{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vkcapture
      obs-vaapi
      obs-pipewire-audio-capture
      input-overlay
    ];
  };
}
