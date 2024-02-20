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
      drag-out = ''${lib.getExe pkgs.xdragon} -a -x "$fx"'';
      extract = ''
        ''${{
          set -f
          ${pkgs.atool}/bin/atool -x $f
        }}
      '';
      fzf-jump = ''
        ''${{
            res="$(find . -maxdepth 1 | fzf --reverse --header='Jump to location')"
            if [ -n "$res" ]; then
                if [ -d "$res" ]; then
                    cmd="cd"
                else
                    cmd="select"
                fi
                res="$(printf '%s' "$res" | sed 's/\\/\\\\/g;s/"/\\"/g')"
                lf -remote "send $id $cmd \"$res\""
            fi
        }}
      '';
      git-branch = ''
        ''${{
            git branch | fzf | xargs git checkout
            pwd_shell=$(pwd | sed 's/\\/\\\\/g;s/"/\\"/g')
            lf -remote "send $id updir"
            lf -remote "send $id cd \"$pwd_shell\""
        }}
      '';
      mp3 = ''
        ''${{
          set -f
          outname=$(echo "$f" | cut -f 1 -d '.')
          ${with lib; getExe pkgs.lame} -V --preset standard $f "$outname.mp3"
        }}
      '';
      archivemount = ''
        ''${{
            mntdir="$f.mnt"
            mkdir -p "$mntdir"
            ${with lib; getExe pkgs.archivemount} "$f" "$mntdir"
            lf -remote "send $id cd $mntdir"
        }}
      '';
      mkdir = ''
        ''${{
          printf "Directory name:"
          read DIR
          mkdir -p $DIR
        }}
      '';
      touch = ''
        ''${{
          printf "File name:"
          read FILE
          touch $FILE
        }}
      '';
      chmod = ''
        ''${{
          printf "Permissions"
          read PERM
          chmod $PERM $file
        }}
      '';
      enter-dir = ''
        ''${{
          prinft "Directory:"
          read DIR
          cd $DIR
        }}
      '';
      on-select = ''
        &{{
          lf -remote "send $id set statfmt \"$(exa -ld --color=always "$f")\""
        }}
      '';
      toggle_preview = ''
        %{{
            if [ "$lf_preview" = "true" ]; then
                lf -remote "send $id :set preview false; set ratios 1:5"
            else
                lf -remote "send $id :set preview true; set ratios 1:2:3"
            fi
        }}
      '';
      on-cd = ''
        on-cd &{{
        	# display repository status in your prompt
        	if [ -d .git ] || [ -f .git ]; then
        		branch=$(git branch --show-current 2>/dev/null) || true
        		remote=$(git config --get branch.$branch.remote 2>/dev/null) || true
        		url=$(git remote get-url $remote 2>/dev/null) || true
        		fmt="\033[32;1m%u@%h\033[0m:\033[34;1m%w\033[0m\033[33;1m [GIT BRANCH:> $branch >> $url]\033[0m"
        	elif [ -d .hg ]; then
        		hg=$(hg branch 2>/dev/null) || true
        		fmt="\033[32;1m%u@%h\033[0m:\033[34;1m%w\033[0m\033[33;1m [HG BRANCH:> $hg]\033[0m"
        	elif [ -d .svn ]; then
        		svn=$(svn info 2>/dev/null | awk '/^URL: /{print $2}') || true
        		fmt="\033[32;1m%u@%h\033[0m:\033[34;1m%w\033[0m\033[33;1m [SVN URL:> $svn]\033[0m"
        	else
        		fmt="\033[32;1m%u@%h\033[0m:\033[34;1m%d\033[0m\033[1m%f\033[0m"
        	fi
        	lf -remote "send $id set promptfmt \"$fmt\""
        }}
      '';
      alt-paste = ''
        &{{
            if [ -n "$fs" ]; then
                lf -remote "send $id $1"
            fi
            lf -remote "send $id paste"
        }}
      '';
      paste = ''
        &{{
            set -- $(cat ~/.local/share/lf/files)
            mode="$1"
            shift
            case "$mode" in
                copy)
                    ${lib.getExe pkgs.rsync} -av --ignore-existing --progress -- "$@" . |
                    stdbuf -i0 -o0 -e0 tr '\r' '\n' |
                    while IFS= read -r line; do
                        lf -remote "send $id echo $line"
                    done
                    ;;
                move) mv -n -- "$@" .;;
            esac
            rm ~/.local/share/lf/files
            lf -remote "send clear"
        }}
      '';
    };
    keybindings = {
      "<f-7>" = "push %mkdir<space>";
      "<f-6>" = "touch";
      "<f-8>" = "delete";
      cm = "chmod";
      a = "archivemount";
      ae = "extract";
      "." = "set hidden!";
      "ch" = "cd";
      "cu" = "cd ..";
      U = "!du -sh";
      td = ''''$${with lib; getExe pkgs.trashy} put "$f"'';
      zp = "toggle_preview";
      l = "mark-load";
      "<enter>" = "open";
      "<shift><enter>" = "edit";
      v = ''''$${with lib; getExe pkgs.bat} --paging=always "$f"'';
      y = "%cp -ri -- $fs .";
      d = "%mv -i -- $fs .";
      P = "alt-paste cut; clear";
      p = "alt-paste copy; clear";
      gb = "git-branch";
      gp = ''''${{clear; git pull --rebase || true; echo "press ENTER"; read ENTER}}'';
      gs = ''''${{clear; git status; echo "press ENTER"; read ENTER}}'';
      gl = ''''${{clear; git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit}}'';
    };
    settings = {
      number = true;
      tabStop = 2;
      cursorpreviewfmt = ''\033[7;90m'';
      previews = false;
      drawbox = false;
      icons = true;
      hidden = false;
      period = 1;
      info = "size:time";
      dircounts = true;
      ratios = 1;
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
