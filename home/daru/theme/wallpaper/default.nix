{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [pkgs.swww];
  wallpaperImage = "${inputs.wallpapers}/walls/dark-leaves.png";
}
