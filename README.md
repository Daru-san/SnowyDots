*Snowy Dots*
===============
My beautiful, functional, focused nix flake with Hyprland, Sway and KDE plasma 6, written completely in nix.

_**Hosted [sourcehut](https://sr.ht "sourcehut") at [SnowyDots](https://git.sr.ht/~darumaka/SnowyDots)**_


<p align="center">
 <img src="https://github.com/Daru-san/Snowflake-dots/assets/135046711/ca25eab0-08da-4bbd-b336-21c43fdc4bab">
</p>
<p align="center">
  <img src="https://img.shields.io/static/v1?label=Nix Flake&message=Check&style=flat&logo=nixos&colorA=24273A&colorB=7EBAE4&logoColor=CAD3F5">
  <img src="https://img.shields.io/static/v1?label=Nixpkgs&message=Unstable&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5">
</p>

<p align="center">
  <img src="https://img.shields.io/static/v1?label=Desktop&message=Hyprland&style=flat&logo=hyprland&colorA=24273A&colorB=5ACBCC&logoColor=CAD3F5">
  <img src="https://img.shields.io/static/v1?label=Desktop&message=Sway&style=flat&logo=Sway&colorA=24273A&colorB=5ACBCC&logoColor=CAD3F5">

<!--
TODO:
* Update screenshot host
* Update screenshots
* Restyle readme
-->

## Environment
* Compositor: [Hyprland](https://github.com/hyprwm/Hyprland "hyprland")/[Swayfx](https://github.com/willpower3309/swayfx)
* Launcher: [anyrun](https://github.com/Kirottu/anyrun "anyrun")
* bar: [waybar](https://github.com/Alexays/Waybar "waybar")
* Browser: [Firefox nightly](https://github.com/nix-community/flake-firefox-nightly "ff nightly")
* Shell: [zsh](http://zsh.sourceforge.net/ "zsh") using [oh-my-zsh](https://ohmyz.sh/ "omz")
* Editor: [Neovim nightly](https://github.com/nix-community/neovim-nightly-overlay "nvn") using my [custom Neovim configuration](https://git.sr.ht/~darumaka/LazyViM)
* Kernel: [Linux-zen](https://archlinux.org/packages/extra/x86_64/linux-zen/ "zen")

# Previews
## Hyprland
![2024-01-17-205556_hyprshot](https://github.com/Daru-san/Snowflake-dots/assets/135046711/ce95b670-10af-46d1-baa0-d71dbdc07da6)
![2024-01-17-203149_hyprshot](https://github.com/Daru-san/Snowflake-dots/assets/135046711/6f567b3a-21b6-41e5-a739-028696698004)
![2024-01-17-205440_hyprshot](https://github.com/Daru-san/Snowflake-dots/assets/135046711/5ecd5b46-2373-4744-b3dc-3984ea9a417c)
![2024-01-17-205959_hyprshot](https://github.com/Daru-san/Snowflake-dots/assets/135046711/40c4515e-8d42-4469-b03e-bcdcc6fbcb06)

## Sway (Swayfx)
![prev1](https://github.com/Daru-san/Snowflake-dots/assets/135046711/f1aed042-1882-4bf1-a217-f247f4641453)
![prev5](https://github.com/Daru-san/Snowflake-dots/assets/135046711/4f4313cd-9e49-4762-9dd2-575931044cc7)


## How to switch desktops
In configuration.nix
```nix
# Enable hyprland or sway in configuration.nix, enable one at a time, not both, since that messes some things
{
  wayland = {
    enable = true;

    # Enabling sway and optionally, swayfx
    sway = {
      enable = true;
      swayfx.enable = false;
    };

    # Enable hyprland
    hyprland.enable = true;

    # You can also enable kde if you want a full desktop environment
    # Particularly kde plasma 6
    kde.enable = true;

	  # You can also use sddm or greetd as greeters
    sddm.enable = true;
    greetd = {
      enable = true;
      command = "Hyprland";
    };
  };
}
```

In home.nix
```nix
# Enable hyprland or sway, it will not work if you enable both at once, unlike in configuration.nix
# They will work whether kde is enabled or not
{
 # Here you can put hyprland or sway
  wayland.compositor = "hyprland";
}
```

# Other
## Custom options
> These options are a way of abstracting normal nix options and compressing them into small, easy to remember options. They're useful for managing multiple systems since you can declare your own customized versions of each option that are optimized for your use cases. It also makes declaring configurations much easier across multiple differing systems with different specs and capabilities.
```nix
{
  # System stuff
  os.system = {
    # enable zram
    zram.enable = true;

    optimization = {
      # Laptop optimizations
      laptop.enable = true;

      # ssd optimizations like fstrim and none
      ssd.enable = true;

      drivers = {
        # Intel drivers
        intel.enable = true;

        # amd drivers
        amd.enable = true;
      };
    };
  };

  # Enable audio using pipewire
  os.audio.enable = true;

  # Enable and configure networking
  os.networking = {
    enable = true;
    # Enable wifi using networkmanager and iwd
    wifi.enable = true;

    # Enable bluetooth and blueman
    bluetooth.enable = true;
  };

  android = {
    # Enable adb
    adb.enable = true;
    # Enable and install waydroid
    waydroid.enable = true;
  };
}
```

## Repository file tree
```
.
├── home
│   ├── daru
│   │   ├── programs
│   │   ├── themes
│   │   └── wayland
│   └── shared
├── install
├── modules
│   ├── home-manager
│   │   ├── audio
│   │   ├── editor
│   │   ├── games
│   │   ├── programs
│   │   ├── shell
│   │   ├── themes
│   │   ├── wayland
│   │   └── xdg
│   └── nixos
│       ├── android
│       ├── fonts
│       ├── neovim
│       ├── shell
│       ├── ssh
│       ├── system
│       └── wayland
├── overlays
├── pkgs
├── specialisations
└── systems
    └── AspireLaptop
```

## Install
I use my own custom nixos iso to install NixOS on my systems, the flake is at [SnowISO](https://git.sr.ht/~darumaka/SnowISO) on sr.ht. It has plenty of useful tools and has sway as a desktop for graphical installs. 

Installation
```bash
# Boot into the installer
# Connect to wifi, instructions on the wiki, link in the helpful links section.
# My installer has network manager installed so I use that instead of wpa utility

# Enter root shell
sudo -i

# Create you partitions, I personally use cfdisk, but you can use any tool e.g parted
cfdisk

# Format your partitions
mkfs.ext4 -L root /dev/root-partition # your partition name here

# It isn't necessary to separate home and root but I do it anyway
mkfs.ext4 -L home /dev/home-partition

# This may not be useful if you use zram but in my case I use both zram and swap partitions
# I'll work on using zram on it's own
# I primarily use swap partitions instead of swap files, set up one like this
mkswap -L swap /dev/swap-partition # replace with your partition
swapon /dev/by-label/swap

# Mount your partitions
mount /dev/by-label/root /mnt
mount --mkdir /dev/boot-partition /mnt/boot
mount --mkdir /dev/by-label/home /mnt/home

nixos-generate-config --root /mnt

# Edit the configuration
cd /mnt/etc/nixos
vi configuration.nix

# Check the partitions to make sure their mount points are correct
# Also check for swap if you're using a partition
vi hardware-configuration.nix

# Once you're done, install the system configuration
nixos-install
```

Deploy my config
```bash
# Clone the github repo
git clone https://github.com/Daru-san/Snowflake-dots

# or the sourcehut repo, which is more up-to-date
git clone https://git.sr.ht/~darumaka/SnowyDots

# You should probably make your own system configurations for compatibility 
# Feel free to edit any files in the repo to suit your needs, otherwise

cd Snowflake-dots/systems/AspireLaptop

# Copy your partitions to the hardware-configuration.nix file
vi hardware-configuration.nix

# Build the system configuration
sudo nixos-rebuild switch --flake .#system e.g .#AspireLaptop

# Then build the home configuration

# If you haven't installed it yet
nix-shell -p home-manager

# Then switch the config
home-manager switch --flake .#daru@AspireLaptop
```

## Resources that I've found as useful
* [NixOS Manual](https://nixos.org/manual/nixos/unstable/ "nix")
* [Erase your darlings](https://grahamc.com/blog/erase-your-darlings/ "persist")
* [NixOS wiki](https://nixos.wiki "nix-wiki")
* [MyNixOS](https://mynixos.com "Best nix resource")
* [NixOS install guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)
## Thanks to, these are configurations and repos I've taken a lot of inspiration from
* [justinlime's waybar configuration](https://github.com/justinlime/dotfiles)
* [D3Ext's aesthetic wallpaper repo](https://github.com/D3Ext/aesthetic-wallpapers "walls")
* [fufexan/dotfiles](https://github.com/fufexan/dotfiles/ "fufexan dots")
* [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config "dots")
* [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs "nix-starter-configs")

<!---
TODO:
* Update Minecraft config
* Learn javascript and configure ags, replace waybar
* Docs, redo docs
* Finish documenting the options
* Update theme modules

--->
