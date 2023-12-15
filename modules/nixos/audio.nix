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
}
