<!-- markdownlint-disable MD003 -->

# SnowyDots

<!--markdownlint-disable-->
<p style="text-align: center;" align="center">
My functional, advanced NixOS configuration.

<p style="text-align: center;" align="center">
<i>Main configuration for <a href="https://sr.ht/~darumaka/SnowOS/">SnowOS</a> </i>
</p>

<div style="text-align: center;" align="center">
    <img src="https://img.shields.io/static/v1?label=NixOS&message=25.05(unstable)&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5"/>
    <img src="https://img.shields.io/static/v1?label=Hyprland&message=0.49&style=flat&logo=Hyprland&colorA=24273A&colorB=9173ff&logoColor=CAD3F5"/>
    <img src="https://img.shields.io/static/v1?label=Sourcehut&message=SnowyDots&style=flat&logo=sourcehut&colorA=24273A&colorB=9173ff&logoColor=CAD3F5" alt="https://git.sr.ht/~darumaka/SnowyDots"/>
</div>

<br>
<!--markdownlint-enable-->

<!-- markdownlint-disable MD003 -->

![Wallpaper](https://i.imgur.com/mdKq12c.png)

![Btop](https://i.imgur.com/I1HYh6V.png)

![Programming](https://i.imgur.com/NUCygDs.png)

![rmpc](https://i.imgur.com/8Z457LW.png)

## Installing NixOS

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

# This may not be useful if like me, youuse zram, without swap devices
# Using swap partitions
mkswap -L swap /dev/swap-partition
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

### Deploy SnowyDots

```bash
# Clone the github repo
git clone https://github.com/Daru-san/SnowyDots snow

# You should probably make your own system configurations for compatibility
# Feel free to edit any files in the repo to suit your needs, otherwise

cd snow/systems/laptop

# Copy your partitions to the hardware-configuration.nix file
vi hardware-configuration.nix

# Build the system configuration
sudo nixos-rebuild switch --flake .#system # e.g .#Aria

# Then build the home configuration

# If you haven't installed it yet
nix shell nixpkgs#home-manager

# Then switch the config
home-manager switch --flake .#daru@Aria
```

## Resources

### Nix and NixOS information

- [NixOS Manual](https://nixos.org/manual/nixos/unstable/ "nix")
- [Nix best practices](https://nix.dev/guides/best-practices.html)
- [NixOS wiki](https://nixos.wiki "nix-wiki")
- [MyNixOS](https://mynixos.com "Best nix resource")
- [NixOS install guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)

### I found useful

- [Nixvim github](https://github.com/nix-community/nixvim)
- [Nix on devdocs](https://devdocs.io/nix/)

### Inspiration

- [fufexan/dotfiles](https://github.com/fufexan/dotfiles/ "fufexan dots")
- [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config "dots")
- [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs "nix-starter-configs")

### On hardening Linux and NixOS and general security

- [ArchWiki on Linux security](https://wiki.archlinux.org/title/security)
- [sioodmy's dotfiles](https://github.com/sioodmy/dotfiles/blob/1e8a972bfbefeeb4150f5707001ce243dce1f6ea/system/core/schizo.nix)
- [Guide on firefox privacy](https://restoreprivacy.com/firefox-privacy/)
- [Comprehensive guide on Linux hardening](https://madaidans-insecurities.github.io/guides/linux-hardening.html)
