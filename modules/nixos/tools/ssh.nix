{
  pkgs,
  lib,
  ...
}:
{
  services.openssh = lib.mkDefault {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
  services.gnome.gcr-ssh-agent.enable = false;
  programs.ssh = {
    enableAskPassword = true;
    askPassword = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
  };
}
