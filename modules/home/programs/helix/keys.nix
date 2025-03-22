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

    C-y = [
      ":sh rm -f /tmp/unique-file"
      ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
      '':insert-output echo "\x1b[?1049h\x1b[?2004h" > /dev/tty''
      ":open %sh{cat /tmp/unique-file}"
      ":redraw"
    ];
  };
}
