{appimageTools, ...}: let
  version = "2.7.10";
in
  appimageTools.wrapType2 {
    name = "bridge-core";
    src = builtins.fetchurl {
      url = "https://github.com/bridge-core/editor/releases/download/v${version}/bridge_${version}_amd64.AppImage";
      sha256 = "0m68xkj7fw3kqx9wrsnip2sk0k9jyd5zm1zrpmr5ar5c2y11s9z6";
    };
  }
