{
  pkgs,
  ...
}:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    comic-relief
    noto-fonts
  ];
}
