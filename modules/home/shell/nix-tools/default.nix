{ config, lib, ... }:
{
  programs = {
    nix-init = {
      enable = true;
      settings = {
        maintainers = [ "daru-san" ];
        nixpkgs = "<nixpkgs>";
        commit = true;
      };
    };

    nix-your-shell = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
    };

    # Direnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
      config = {
        whitelist.prefix = [
          "~/Forest/Development"
        ];
        global.disable_stdin = true;
      };
    };

    # Nh
    nh = {
      enable = true;
      flake = "${config.home.homeDirectory}/snow/dots";
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = lib.concatStringsSep " " [
          "-k 2"
          "-K 3d"
        ];
      };
    };
  };
}
