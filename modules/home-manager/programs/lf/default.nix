{
  pkgs,
  lib,
  ...
}: {
  xdg.configFile."lf/icons".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/gokcehan/lf/master/etc/icons.example";
  };
  programs.lf = {
    enable = true;
    commands = {
      open = "$$OPENER $f";
      edit = "$$EDITOR $f";
      drag-out = ''${with lib; getExe pkgs.xdragon} -a -x "$fx"'';
      mkdir = ''
        ''${{
          printf "Directory name:"
          read DIR
          mkdir -p $DIR
        }}
      '';
    };
    keybindings = {
      m = "mkdir";
      "." = "set hidden!";
      "ch" = "cd";
      "cu" = "cd ..";
      U = "!du -sh";
      gg = null;
      D = "trash";
      l = "mark-load";
      "<enter>" = "open";
      "<shift><enter>" = "edit";
      v = ''''$${with lib; getExe pkgs.bat} --paging=always "$f"'';
    };
    settings = {
      number = true;
      tabStop = 2;
      previews = true;
      drawbox = true;
      icons = true;
      hidden = true;
      ratios = [
        1
        1
        2
      ];
    };

    extraConfig = let
      previewer = pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5

        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi

        ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';
  };
}
