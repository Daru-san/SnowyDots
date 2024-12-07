{ inputs, ... }:
{
  imports =
    [ inputs.base16.homeManagerModule ]
    ++ [
      ./qt.nix
      ./fonts.nix
      ./gtk.nix
    ];

  # Wallpaper
  wallpaperImage = inputs.walls + "/images/dark-leaves.png";

  # Color scheme
  scheme = "${inputs.tinted-themes}/base24/one-dark.yaml";
}
