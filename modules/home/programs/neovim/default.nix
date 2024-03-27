{inputs, ...}: {
  imports = with inputs.snowyvim.homeManagerModules; [default];
  programs.snowvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
