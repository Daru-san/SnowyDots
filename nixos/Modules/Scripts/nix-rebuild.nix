{networking, ...}:
''
  while getopts m: flag
    do
      case "$flag" in
         m) mode=$OPTARG;;
      esac
    done   
cd $repo 
sudo nixos-rebuild $mode .#${networking.hostname} --impure
''
