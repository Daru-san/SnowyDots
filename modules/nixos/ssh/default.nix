{pkgs, ...}:{
  services.openssh = mkDefault {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    askPassword = "${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass";
    enableAskPassword = true;
  };
}
