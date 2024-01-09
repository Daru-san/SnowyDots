{appimageTools, ...}:
  appimageTools.wrapType2 { 
    name = "bridge-core";
    src = builtins.fetchurl {
      url = "https://github.com/bridge-core/editor/releases/download/v2.7.9/bridge_2.7.9_amd64.AppImage";
    };
    extraPkgs = pkgs: with pkgs; [ ];
}

