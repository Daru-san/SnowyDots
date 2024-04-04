{pkgs, ...}: {
  programs.adb.enable = true;
  services.gvfs.enable = true;
  environment.systemPackages = [pkgs.jmtpfs];
  virtualisation.waydroid.enable = true;
}
