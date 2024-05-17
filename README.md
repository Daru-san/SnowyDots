# SnowyDots

<p style="text-align: center;" align="center">
My functional, advanced NixOS configuration flake using <a href="https://github.com/hyprwm/hyprland">Hyprland</a>.
</p>

<div style="text-align: center;" align="center">
    <img src="https://img.shields.io/static/v1?label=Hyprland&message=v0.40.0&style=flat&logo=hyprland&colorA=24273A&colorB=8AADF4&logoColor=CAD3F5"/>
    <img src="https://img.shields.io/static/v1?label=NixOS&message=24.05(unstable)&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5"/>
    <img src="https://img.shields.io/static/v1?label=Sourcehut&message=SnowyDots&style=flat&logo=sourcehut&colorA=24273A&colorB=9173ff&logoColor=CAD3F5" alt="https://git.sr.ht/~darumaka/SnowyDots"/>
</div>

## Showcase

### Hyprland

![Image](https://i.imgur.com/4svyKaE.png 'I use Nix by the way')
![Image](https://i.imgur.com/JnzkFhK.png 'Java > everything else')
![image](https://i.imgur.com/vGkkXsx.png 'Study with me?')
![image](https://i.imgur.com/Q0cOgNT.png 'Firefox looking amazing')
![Image](https://i.imgur.com/lMwQ1qy.png 'Read with me?')

## Systems

### Aurorus (Acer Laptop)

- Kernel: [Linux](https://kernel.org/ 'Stock kernel') with custom tweaks
- Shell: [zsh](http://zsh.sourceforge.net/ 'zsh') configured with [oh-my-posh](https://ohmyposh.dev/), [antidote](https://getantidote.github.io/) and [prezto](https://github.com/sorin-ionescu/prezto)
- Editor: [SnowyVim](https://git.sr.ht/~darumaka/SnowyVim), my custom [Neovim](https://github.com/neovim/neovim) configuration made with [nixvim](https://github.com/nix-community/nixvim)
- Window Manager: [Hyprland](https://github.com/hyprwm/Hyprland 'hyprland')
- Launcher: [anyrun](https://github.com/Kirottu/anyrun 'anyrun')
- Bar: [waybar](https://github.com/Alexays/Waybar 'waybar')

## Flake Info

### Packages provided by my flake

- [gh-s](https://github.com/gennaro-tedesco/gh-s), a Github extension for searching through Github repositories
- [zaread](https://github.com/paolop/zaread), a script that can open different files like docx files in zathura
- [bridge-core](https://github.com/bridge-core/editor), a Minecraft add-on creator for Minecraft Bedrock Edition
- [gh-download](https://github.com/yuler/gh-download), a Github extension for downloading any file from a Github repo without cloning it

## Installing NixOS

I use my own custom nixos iso to install NixOS on my systems, the flake is at [SnowISO](https://git.sr.ht/~darumaka/SnowISO) on sr.ht. It has plenty of useful tools and has sway as a desktop for graphical installs.

### Installation

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

# This may not be useful if like me, you only use zram, without swap devices
# I usually use swap partitions instead of swap files, set up one like this
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

### Deploy my config

```bash
# Clone the github repo
git clone https://github.com/Daru-san/SnowyDots snow

# You should probably make your own system configurations for compatibility
# Feel free to edit any files in the repo to suit your needs, otherwise

cd snow/systems/laptop

# Copy your partitions to the hardware-configuration.nix file
vi hardware-configuration.nix

# Build the system configuration
sudo nixos-rebuild switch --flake .#system # e.g .#Aurorus

# Then build the home configuration

# If you haven't installed it yet
nix shell nixpkgs#home-manager

# Then switch the config
home-manager switch --flake .#daru@Aurorus
```

## Thanks to

### For their useful information on NixOS and Nix

- [NixOS Manual](https://nixos.org/manual/nixos/unstable/ 'nix')
- [Nix best practices](https://nix.dev/guides/best-practices.html)
- [NixOS wiki](https://nixos.wiki 'nix-wiki')
- [MyNixOS](https://mynixos.com 'Best nix resource')
- [NixOS install guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)

### For their inspiration

- [fufexan/dotfiles](https://github.com/fufexan/dotfiles/ 'fufexan dots')
- [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config 'dots')
  [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs 'nix-starter-configs')
- Plenty of others that I cannot remember
