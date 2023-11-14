#Ani cli config, terminal anime client
{config, pkgs, ...}:
{ 
  home.packages = with pkgs; [
    ani-cli

    #Anime downloading script for ani-cli
    (pkgs.writeShellScriptBin "dl-anime"''
      cd ~/Anime

      while getopts n:e: flag
    do
      case "$flag" in
         n) name=$OPTARG;;
         e) episode=$OPTARG;;
         s) dub=$OPTARG;;
      esac
    done   

      echo 'Downloading $name, episode(s) $episode.'
      sleep 1
      echo 'Downloading $name, episode(s) $episode..'
      sleep 1
      echo 'Downloading $name, episode(s) $episode...'      
      sleep 4
      ${ani-cli} --download -e $episode $name --$d
    '')

    #For anilist tracking
    anup
  ];
}
