{ inputs, ... }:
{
  imports = [ inputs.hyprshell.homeModules.default ];
  programs.hyprshell = {
    enable = true;
    systemd.enable = true;
    settings = {
      layerrules = true;
      launcher.enable = false;
      windows = {
        enable = true;
        overview.enable = true;
        switch.enable = true;
      };
    };
  };
}
