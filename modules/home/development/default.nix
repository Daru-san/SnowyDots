{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    hut
    codeberg-cli
    vala
    rustc
    clang
    zig
    jq
    license-go
    yq-go
    gdb
    seer
    valgrind
    xmake
    go
    woodpecker-cli
    rustup
    git-repo
    socat
    rojo
    nasm
    zbus-xmlgen
    # dotnet-sdk_9
    android-translation-layer
    nnd
    bacon
    glab
    icon-library
    luajit
    # ida-free
    luajitPackages.tl
  ];
  programs.java = {
    enable = false;
  };
}
