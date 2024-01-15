{pkgs, config, ...}:{
  home.packages = with pkgs; [
    swayws
    swayr
    swaytools
    swaysettings
  ] ++ [
    config.nur.repos.misterio.swayfader
  ];
}
