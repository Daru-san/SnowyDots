{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.sway.config.startup = [
    {command = "systemctl --user start swaync.service";}
    {command = "${config.services.copyq.package}/bin/copyq";}
    {command = "${pkgs.autotiling-rs}/bin/autotiling-rs";}
    {command = "${pkgs.swww}/bin/swww init";}
    {
      command = "systemctl --user restart kanshi";
      always = true;
    }
    {command = "systemctl --user start hypridle";}
    {command = "systemctl --user start lxpolkit";}
    {command = "${config.nur.repos.misterio.swayfader}/bin/swayfader";}
  ];
}
