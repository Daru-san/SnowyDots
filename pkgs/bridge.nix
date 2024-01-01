{appimageTools, ...}:
  appimageTools.wrapType2 { 
    name = "bridge-core";
    src = builtins.fetchurl {
      url = "https://github.com/bridge-core/editor/releases/download/v2.7.8/bridge_2.7.8_amd64.AppImage";
    };
    extraPkgs = pkgs: with pkgs; [ ];
}

