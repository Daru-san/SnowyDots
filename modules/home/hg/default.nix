{pkgs, ...}: {
  programs.mercurial = {
    enable = true;
    package = pkgs.mercurialFull;
    userEmail = "mica.tui@proton.me";
    userName = "darumaka";
  };
}
