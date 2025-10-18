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
    zbus-xmlgen
    dotnet-sdk_9
    bacon
    glab
    icon-library
    luajit
    luajitPackages.tl
  ];
  programs.java = {
    enable = true;
  };
}
