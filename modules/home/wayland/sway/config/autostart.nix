{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.sway.config.startup = [
    {command = "systemctl --user start swaync";}
    {command = "${config.services.copyq.package}/bin/copyq";}
    {command = "${pkgs.autotiling-rs}/bin/autotiling-rs";}
    {
      command = "systemctl --user restart kanshi";
      always = true;
    }
    {command = "systemctl --user start hypridle";}
    {command = "systemctl --user start swayosd";}
    {command = "systemctl --user start wlsunset";}
    {command = "systemctl --user start lxpolkit";}
    {command = "${config.nur.repos.misterio.swayfader}/bin/swayfader";}
  ];
}
