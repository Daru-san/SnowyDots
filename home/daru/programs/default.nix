# Home packages for daru
{
  pkgs,
  lib,
  ...
}: {
  imports = [./desktop-entries.nix ./nautilus.nix];

  home.packages = with lib;
    mkMerge [
      (with pkgs; [
        newsflash
        archiver
        overskride
        pavucontrol
        iwgtk
      ])
      # GNOME related packages
      (with pkgs.gnome; [nautilus dconf-editor gnome-clocks file-roller gnome-calculator])
      # These are pinned to 23.11(stable branch) since they're broken on unstable
      (with pkgs.stable; [komikku calcure])
    ];
}
