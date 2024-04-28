{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [pkgs.swww];
  wallpaperImage = "${inputs.wallpapers}/images/dark-leaves.png";
}
