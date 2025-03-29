{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    tempDir = "/tmp/cups";
    webInterface = true;
    openFirewall = true;
    drivers = with pkgs; [
      hplip
    ];
    browsed.enable = true;
    startWhenNeeded = true;
  };
}
