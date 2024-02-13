{...}: {
  imports = [./git.nix];
  programs.gitui = {enable = true;};
}
