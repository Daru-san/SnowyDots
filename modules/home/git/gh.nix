{ pkgs, ... }:
{
  programs = {
    gh-dash.enable = true;
    gh = {
      enable = true;
      extensions = with pkgs; [
        gh-poi
        gh-markdown-preview
        gh-eco
        gh-notify
        gh-f
        ghq
        gh-cal
        gh-s
      ];
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
        aliases = {
          co = "pr checkout";
          pv = "pr view";
        };
      };
    };
  };
}
