{ pkgs, ... }:
let
  yazi-picker = pkgs.writeShellScriptApplication "yazi-picker" {
    runtimeInputs = [
      pkgs.tmux
      pkgs.yazi
    ];
    text = ''
      paths=$(yazi --chooser-file=/dev/stdout)

      if [[ -n "$paths" ]]; then
      	tmux last-window
      	tmux send-keys Escape
      	tmux send-keys ":$1 $paths"
      	tmux send-keys Enter
      else
      	tmux kill-window -t fx
      fi
    '';
  };
in
{
  normal = {
    "tab" = ":buffer-next";
    "S-tab" = ":buffer-previous";
    "C-s" = ":write";
    "S-esc" = ":quit!";
    "C-g" = [
      ":write-all"
      ":new"
      ":insert-output lazygit"
      ":buffer-close!"
      ":redraw"
      ":reload-all"
    ];
    "C-y" = ":sh tmux new-window -n fx '${yazi-picker} open'";
  };
}
