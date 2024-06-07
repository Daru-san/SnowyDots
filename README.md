# SnowyDots

---

<p style="text-align: center;" align="center">
My functional, advanced NixOS configuration flake using <a href="https://github.com/hyprwm/hyprland">Hyprland</a>.
</p>

<div style="text-align: center;" align="center">
    <img src="https://img.shields.io/static/v1?label=Hyprland&message=v0.40.0&style=flat&logo=hyprland&colorA=24273A&colorB=8AADF4&logoColor=CAD3F5"/>
    <img src="https://img.shields.io/static/v1?label=NixOS&message=24.11(unstable)&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5"/>
    <img src="https://img.shields.io/static/v1?label=Sourcehut&message=SnowyDots&style=flat&logo=sourcehut&colorA=24273A&colorB=9173ff&logoColor=CAD3F5" alt="https://git.sr.ht/~darumaka/SnowyDots"/>
</div>

---

## Showcase

### Hyprland

> [Wallpapers](https://git.sr.ht/~darumaka/Wallpapers "My wallpaper repo on sourcehut")

![Image](https://i.imgur.com/JFG3WXL.png "I use Nix by the way")
![Image](https://i.imgur.com/jxUHhj7.png "Java > everything else")
![image](https://i.imgur.com/vGkkXsx.png "Study with me?")
![image](https://i.imgur.com/MJFsa7E.png "Firefox looking amazing")
![Image](https://i.imgur.com/lMwQ1qy.png "Read with me?")

## Systems

### Aurorus (Acer Laptop)

- Kernel: [Linux hardened](https://kernel.org/ "Stock kernel") with custom tweaks
- Shell: [Fish](https://github.com/fish-shell/fish-shell) with [Starship](https://github.com/starship/starship)
- Editor: [SnowyVim](https://git.sr.ht/~darumaka/SnowyVim)
- Window Manager: [Hyprland](https://github.com/hyprwm/Hyprland "hyprland")
- Launcher: [anyrun](https://github.com/Kirottu/anyrun "anyrun")
- Bar: [waybar](https://github.com/Alexays/Waybar "waybar")

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

## Resources

### Nix and NixOS information

- [NixOS Manual](https://nixos.org/manual/nixos/unstable/ "nix")
- [Nix best practices](https://nix.dev/guides/best-practices.html)
- [NixOS wiki](https://nixos.wiki "nix-wiki")
- [MyNixOS](https://mynixos.com "Best nix resource")
- [NixOS install guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)

### Really useful

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
