{inputs, ...}: {
  imports = [inputs.snowyvim.homeManagerModules.default];
  programs.snowvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
