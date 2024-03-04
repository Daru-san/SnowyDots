{
  outputs,
  inputs,
  ...
}: {
  imports =
    [./home.nix]
    ++ (with outputs.homeManagerModules; [
      audio
      editor
      programs
      xdg
      themes
      shell
    ]);
}
