{...}: {
  imports = [./git.nix];
  programs.gitui = {enable = true;};
  programs.git-cliff = {enable = true;};
}
