{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      rust-lang.rust-analyzer
      sumneko.lua
      mesonbuild.mesonbuild
      zainchen.json
      samuelcolvin.jinjahtml
      davidanson.vscode-markdownlint
      shd101wyy.markdown-preview-enhanced
      waderyan.gitblame
      davidlday.languagetool-linter
      eamodio.gitlens
      dart-code.flutter
      hars.cppsnippets
      mkhl.direnv
      aaron-bond.better-comments
    ];
  };
}
