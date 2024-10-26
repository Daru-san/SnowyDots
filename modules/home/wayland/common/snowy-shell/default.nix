{ inputs, ... }:
{
  imports = [ inputs.snowy-shell.homeManagerModules.default ];
  programs.snowy-shell = {
    systemd.enable = true;
  };
}
