{ pkgs, ... }:
{
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          qt6Packages.fcitx5-configtool
          fcitx5-material-color
          qt6Packages.fcitx5-unikey
        ];
        waylandFrontend = true;
      };
    };
  };
}
