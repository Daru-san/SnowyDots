{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
      obs-pipewire-audio-capture
      input-overlay
      obs-websocket
    ];
  };
}
