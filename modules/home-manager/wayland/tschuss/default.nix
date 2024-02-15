{
  pkgs,
  lib,
  config,
  ...
}: {
  xdg.configFile."tschuss/icons" = let
    repo = pkgs.fetchFromGitHub {
      owner = "Lucad44";
      repo = "tschuss";
      rev = "6ee14d8dfaa64b9b1f70cc6c4856c348ac10f5ee";
      hash = "sha256-jfl8JcWq6dvKwGR19vXNwzUGB/GAnftqGVDECBRIjvE=";
    };
  in {
    source = "${repo}/icons";
  };
  home.packages = with pkgs; [tschuss];
  xdg.configFile."tschuss/tschuss.conf".text = with builtins; readFile ./config;
  xdg.configFile."tschuss/style.css".text = ''
    ${config.theme.colorScheme.css}
    ${with builtins; readFile ./style.css}
  '';
}
