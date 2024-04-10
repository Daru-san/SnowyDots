{
  pkgs,
  config,
  ...
}: {
  xsession.windowManager.i3.config.startup = [
    {command = "${config.services.copyq.package}/bin/copyq";}
    {command = "${pkgs.autotiling-rs}/bin/autotiling-rs";}
    {command = "${pkgs.feh}/bin/feh --bg-fill ${config.wallpaperImage}";}
    {command = "${pkgs.picom}/bin/picom";}
    {command = "systemctl --user start lxpolkit";}
  ];
}
