{
  outputs,
  inputs,
  ...
}: {
  imports =
    [./home.nix]
    ++ [./themes/default.nix ./wayland/default.nix ./programs/default.nix]
    ++ (with outputs.homeManagerModules; [
      audio
      editor
      programs
      xdg
      wayland
      shell
      themes
      languages
    ])
    ++ (with inputs; [
      hyprland.homeManagerModules.default
    ]);
}
