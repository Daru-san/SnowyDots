{pkgs, ...}:{
  home.packages = with pkgs; [
    swayws
    swayr
    swaysome
    swaysettings
  ];
}
