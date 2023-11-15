{config, pkgs, lib, ...}:{

  home.packages = with pkgs; [
    ranger
  ];
  #Symlinking the ranger config
  home.file.".config/ranger/rc.conf".source = config.lib.file.mkOutOfStoreSymlink ./config/rc.conf;
  
  #Ranger commands script
  home.file.".config/ranger/commands.py".text = ''
    from plugins.ranger_udisk_menu.mounter import mount
  '';

  #Devicons plugin
  home.file.".config/ranger/plugins/ranger_devicons" = {
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "alexanderjeurissen";
      repo = "ranger_devicons";
      rev = "de64ab26fb581c00a803381d522c6b3e48b79415";
      sha256 = "6JEhyU08QEkGdRW2L00ynRaoaaR5PaiVUccEUbtTQuU=";
    };
  };

  #archives plugin
  home.file.".config/ranger/plugins/ranger-archives" = {
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "maximtrp";
      repo = "ranger-archives";
      rev = "62783ddb84c8fd25eba1be1607d3a47e8efe8b31";
      sha256 = "hSwTsWrbX+unvm9f7dkCRljc6EM9bhGOHRaLNo7ehio=";
    };
  };

  #udisk menu
  home.file.".config/ranger/plugins/ranger_udisk_menu" = {
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "SL-RU";
      repo = "ranger_udisk_menu";
      rev = "c892d447177051dd2fa97e2387b2d04bf8977de7";
      sha256 = "NCw8U3t576+y4nfmWTQEhU0j9+yBtHTivJ+JAxyCbBs=";
    };
  };
}
