{ pkgs, ... }:
{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
  services.printing = {
    enable = true;
    tempDir = "/tmp/cups";
    webInterface = true;
    openFirewall = true;
    browsing = true;
    drivers = with pkgs; [
      hplipWithPlugin
    ];
    browsed.enable = true;
    startWhenNeeded = true;
  };
}
