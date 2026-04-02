{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      libheif
      libheif.out
    ];
    pathsToLink = [ "share/thumbnailers" ];
  };
}
