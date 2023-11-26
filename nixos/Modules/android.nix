{pkgs, ...}:{

  #Enable ADB
  programs.adb.enable = true;

  #Enable gvfs for automounting android devices
  services.gvfs.enable = true;

  #Enable waydroid
  virtualisation.waydroid.enable = true;
  
  #Enable KDE Connect
  programs.kdeconnect = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    #Same as gvfs but can be configured to mount to actual directories
    jmtpfs
  ];
}
