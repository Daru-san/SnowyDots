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
          "${config.home.homeDirectory}/Cabin/Dev"
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

    nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = true;
      settings = {
        indexes = [
          "nixpkgs"
          "home-manager"
          "nixos"
          "nur"
        ];
        experimental = {
          render_docs_indexes = {
            nvf = "https://notashelf.github.io/nvf/options.html";
          };
        };
      };
    };
  };
}
