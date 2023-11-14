{...}:{

  #Enable ADB
  programs.adb.enable = true;

  #Enable gvfs for automounting android devices
  services.gvfs.enable = true;

  #Enable waydroid
  virtualisation.waydroid.enable = true;
}
