{
  inputs,
  system,
  ...
}: {
  home.packages = [inputs.snowyvim.packages.${system}.default];
  home.sessionVariables.EDITOR = "nvim";
}
