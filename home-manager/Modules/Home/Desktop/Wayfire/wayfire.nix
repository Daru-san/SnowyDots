{config, pkgs, ...}:{ 
  home.packages = with pkgs; [
    wayfire
  ];
  home.file.".config/wayfire.ini".source = config.lib.file.mkOutOfStoreSymlink ./wayfire.ini;
}
