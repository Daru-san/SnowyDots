{ pkgs, ... }:
let
  nautEnv = pkgs.buildEnv {
    name = "nautilus-env";

    paths = with pkgs; [
      nautilus
      nautilus-python
      turtle
      nautilus-open-any-terminal
    ];
  };
in
{
  home = {
    packages = [ nautEnv ];
    sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${nautEnv}/lib/nautilus/extensions-4";
  };

  dconf.settings."com/github/stunkymonkey/nautilus-open-any-terminal".terminal = "ghostty";
}
