{pkgs, ...}:{

  #Enable ADB
  programs.adb.enable = true;

  #Enable gvfs for automounting android devices
  services.gvfs.enable = true;

  #Enable waydroid
  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs.unstable; [
    #Same as gvfs but can be configured to mount to actual directories
    jmtpfs
  ];
}
