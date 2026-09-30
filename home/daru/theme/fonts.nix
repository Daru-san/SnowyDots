{
  pkgs,
  ...
}:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    comic-relief
    noto-fonts
    noto-fonts-cjk-sans-static
    sarasa-gothic
    ipafont
  ];
}
