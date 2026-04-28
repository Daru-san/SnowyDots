{
  inputs,
  ...
}:
{
  imports =
    (with inputs; [
      stylix.homeModules.stylix
    ])
    ++ [
      ./qt.nix
      ./fonts.nix
      ./gtk.nix
    ];

  stylix.targets = {
    gtk.enable = false;
    spicetify.enable = false;
    gdu.enable = true;
    fcitx5.enable = true;
  };
}
