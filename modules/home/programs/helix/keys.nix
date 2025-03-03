{
  normal = {
    "tab" = ":buffer-next";
    "S-tab" = ":buffer-previous";
    "C-s" = ":write";
    "esc-esc" = "quit!";
    "C-g" = [
      ":write-all"
      ":new"
      ":insert-output lazygit"
      ":buffer-close!"
      ":redraw"
      ":reload-all"
    ];
  };
}
