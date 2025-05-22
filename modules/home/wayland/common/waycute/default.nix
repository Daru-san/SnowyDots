{
  pkgs,
  inputs,
  system,
  ...
}:
let
  waycute = inputs.waycute.packages.${system}.waycute;
  quickshell = inputs.waycute.inputs.quickshell.packages.${system}.quickshell;
in
{
  home.packages =
    [
      waycute
      quickshell
    ]
    ++ (with pkgs.qt6; [
      qtdeclarative
    ]);
}
