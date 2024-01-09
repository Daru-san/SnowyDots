❄️ Snowflake-dots ❄️ 
===============
My beautiful, functional NixOS Sway configurations, written completely in Nix
<p align="center">
 <img src="https://github.com/Daru-san/Snowflake-dots/assets/135046711/ca25eab0-08da-4bbd-b336-21c43fdc4bab">
</p>

<p align="center">
<img src="https://img.shields.io/static/v1?label=Nix Flake&message=Check&style=flat&logo=nixos&colorA=24273A&colorB=7EBAE4&logoColor=CAD3F5">
 <a>
<img src="https://img.shields.io/static/v1?label=Desktop&message=Swayfx&style=flat&logo=sway&colorA=24273A&colorB=5ACBCC&logoColor=CAD3F5">
  <a>
   <img src="https://img.shields.io/static/v1?label=Nixpkgs&message=Unstable&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5">
  </a>
 </a>
</p>

 ## Environment                                                                                                                                                               
* Desktop: [Swayfx](https://github.com/WillPower3309/swayfx "swayfx")
* Launcher: [anyrun](https://github.com/Kirottu/anyrun "anyrun")
* bar: [waybar](https://github.com/Alexays/Waybar "waybar")                                                                                                                                         
* Browser: [Firefox nightly](https://github.com/nix-community/flake-firefox-nightly "ff nightly")                                                                                                                                                   
* Shell: [zsh](http://zsh.sourceforge.net/ "zsh") using [oh-my-zsh](https://ohmyz.sh/ "omz") and [oh-my-posh](https://ohmyposh.dev/ "omp")
* Editor: [Neovim nightly](https://github.com/nix-community/neovim-nightly-overlay "nvn") using [NvChad](https://nvchad.com/ "chads")
* Kernel: [Linux-zen](https://archlinux.org/packages/extra/x86_64/linux-zen/ "zen")
   
## Previews
<p float="left">
  <img src="https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev1.png" width="70%" />
  <img src="https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev2.png" width="70%" />
  <img src="https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev3.png" width="32%" />
  <img src="https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev4.png" width="32%" />
  <img src="https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev5.png" width="32%" />
</p>---

## Directory Structure:
```
.
├── home
│   └── daru
│       └── Modules
├── modules
│   ├── home-manager
│   └── nixos
├── nixos-configs
│   └── AspireLaptop
│       └── Modules
├── overlays
├── pkgs
├── flake.nix
└── flake.lock
```
<!---
## Installation
Note: This may not work for every use case and I'd rather you copied individual config files than built the whole thing, since there are *many* device specific configurations here.

Cloning the repo
```bash
#Clone the repo   
git clone github.com/Daru-san/Snowflake-dots ~/snowflake 
cd ~/snowflake/ 

#Build the configuration
cd ~/snowflake
sudo nixos-rebuild {switch/boot} --flake .#AspireNix #Laptop configuration 
home-manager switch --flake .#daru@AspireNix #my user(daru) found in /home/daru
```
--->
## Install
Instructions coming soon!

## Big thanks to
* [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs "nix-starter-configs")
* [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config "dots")
* [D3Ext's aesthetic wallpaper repo](https://github.com/D3Ext/aesthetic-wallpapers "walls")
* [NixOS Manual](https://nixos.org/manual/nixos/unstable/ "nix")
* [Erase your darlings](https://grahamc.com/blog/erase-your-darlings/ "persist")
* [NixOS wiki](https://nixos.wiki "nix-wiki")
* [MyNixOS](https://mynixos.com "Best nix resource")
* [justinlime's waybar configuration](https://github.com/justinlime/dotfiles)
<!---
TODO:
* Properly implement impermanence
* Fix plymouth display issues
* Update Minecraft config
* Learn javascript and configure ags, replace waybar
--->
