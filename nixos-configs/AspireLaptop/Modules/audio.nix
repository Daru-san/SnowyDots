{...}:{
  #Enable sound
  sound.enable = true;

  # hardware.pulseaudio.enable = true;
  
  security.rtkit.enable = true;

  #Enable pipewire over pulseaduio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;

    #media-session.enable = true;
  };
}
