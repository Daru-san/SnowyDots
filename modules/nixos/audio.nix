{...}:{
  # Enable sound
  sound.enable = true;
 
  # Enable rtkit
  security.rtkit.enable = true;

  # Enable pipewire 
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Fix for mpd not working on pipewire from https://nixos.wiki/wiki/MPD
  services.mpd ={
    user = "userRunningPipeWire";
    enable = true;
    musicDirectory = "/home/daru/Music";
    extraConfig = ''
      audio_output {
        type            "pipewire"
        name            "Music"
      }
    '';
    startWhenNeeded = true;
  };
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };
}
