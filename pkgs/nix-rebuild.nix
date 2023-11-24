{...}:
''
  while getopts m: flag
    do
      case "$flag" in
         m) mode=$OPTARG;;
      esac
    done  

  hostname=$(hostname -f)
  cd $HOME/Projects/repo
  sudo nixos-rebuild $mode --flake .#$hostname --impure
''
