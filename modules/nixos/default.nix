#Shared system modules
{
  lxpolkit = import ./lxpolkit.nix;
  android-tools = import ./android-tools.nix;
  audio = import ./audio.nix;
  wayland = import ./wayland.nix;
  greetd = import ./greetd.nix;
  kde = import ./kde.nix;
  intel-gpu = import ./intel-gpu.nix;
  neovim = import ./neovim.nix;
  shells = import ./shells.nix;
  plymouth = import ./plymouth.nix;
  system76 = import ./system76.nix;
  fonts = import ./fonts.nix;
}
