{appimageTools, ...}:
  appimageTools.wrapType2 { 
    name = "bridge-core";
    src = builtins.fetchurl {
      url = "https://github.com/bridge-core/editor/releases/download/v2.7.9/bridge_2.7.9_amd64.AppImage";
      sha256 = "1ayq75rk0wbvl2apzm8906m3jyh7xl3xbrx460v430wjwpg4d7nx";
    };
    extraPkgs = pkgs: with pkgs; [ ];
}

