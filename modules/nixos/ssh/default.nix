{pkgs, lib, ...}:
with lib;
{
  services.openssh = mkDefault {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
  programs.ssh = { 
    enableAskPassword = true;
    askPassword = "${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass";
  };
}
