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
    dotnet-sdk_9
    bacon
  ];
  programs.java = {
    enable = true;
  };
}
