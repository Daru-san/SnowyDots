{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      libheif
      libheif.out
    ];
    pathsToLink = [ "share/thumbnailers" ];
    etc."xdg/menus/applications.menu".source =
      "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  };
}
