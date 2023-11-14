#Wallpaper config
{config, pkgs, lib, ...}: let
  #Set wallpapers from https://github.com/D3Ext/aesthetic-wallpapers
  wallpapers = pkgs.fetchgit {
    url = "https://github.com/D3Ext/aesthetic-wallpapers";
    rev = "f1a4270055bdb7856e127553db3f420";
    sha256 = "09cc87qywwvx44ajbnjg2v0jzp05ymgnmfm0b45qqdxqlamx5034";
  };
in {

  imports = [
    ./wpaperd/default.nix
  ];
  home.packages = with pkgs; [
    swww #Wallpaper support for wayland
    #swaybg #uncomment to enable swaybg

    #Script for wallpaper(you can use it choose between sway and swww depending on your setup)
    (pkgs.writeShellScriptBin "wall-script" ''
      kill() {
        pkill swww-daemon
        pkill swaybg
        sleep 3
        notify-send 'Killed all wallpaper daemons'
      }
      print_usage() {
        printf "usage: wall-script -w (wallpaper program:swww or swaybg) -i (image)"
      }
      while getopts w:i:k:h: flag #w for wallpaper program(swaybg or swww); i for image
    do
      case "$flag" in
         w) program=$OPTARG;;
         i) image=$OPTARG;;
         k) kill
            exit 1;;
         h) print_usage
            exit 1;;
      esac
    done
        pkill wpaperd
         if [[ $program = "swww" ]]
          then
            echo "using swww for wallpaper"
            pkill swww-daemon
            swww init
            sleep 2
            swww img $image
            notify-send "Wallpaper has been set successfully"
         elif [[ $program = "swaybg" ]]
          then
            echo "using swaybg for wallpaper"
            pkill swaybg
            swaybg -i $image
            notify-send "Wallpaper has been set successfully"
        else
          notify-send "Wallpaper daemon not specified, please specify one in the config"
        fi   
     '')
  ];
#Clone wallpapers repo 'github.com/D3Ext/aesthetic-wallpapers'
  home.file."Wallpapers" = {
    source = "${wallpapers}/images";
    recursive = true;
  };
}
