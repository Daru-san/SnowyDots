{...}:{
  imports = [./home.nix] ++ [
    ./themes/default.nix
    ./wayland/default.nix
    ./programs/default.nix
  ] ++ (with outputs.homeManagerModules; [
    audio
    connect
    mpv
    ranger
    xdg
    wayland
    shell
    btop
    git
    neovim
    tmux
  ]);
  wayland.ags.enable = false; 
  audio = {
    easyeffects.enable = true;
    playerctl.enable = true;
  };
  connect = {
    syncthing.enable = true;
    kdeconnect.enable = true;
  };
}
