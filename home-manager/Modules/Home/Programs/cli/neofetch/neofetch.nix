#Neofetch 
{config,pkgs,lib,...}:{
  home.packages = with pkgs.unstable; [
    neofetch
  ];
#Symlink neofetch configs
  home.file.".config/neofetch".source = config.lib.file.mkOutOfStoreSymlink ./config;
}
