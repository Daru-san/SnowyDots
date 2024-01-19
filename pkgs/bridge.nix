{appimageTools, ...}:
let
  version = "v2.7.10";
in
  appimageTools.wrapType2 {
    name = "bridge-core";
    src = builtins.fetchurl {
      url = "https://github.com/bridge-core/editor/releases/download/${version}/bridge_${version}_amd64.AppImage";
      sha256 = "sbA+c5FJa7xTqgqwzKlGvjqjN79L+tCWRgiFH25PCuY=";
    };
}

