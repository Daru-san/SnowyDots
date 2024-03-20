# Snowy Dots

My beautiful, functional, focused nix flake with Hyprland, Sway and KDE plasma 6, written completely in nix.

***Hosted at [SnowyDots](https://git.sr.ht/~darumaka/SnowyDots)***

## Showcase

### Hyprland

![Image](https://i.imgur.com/XI7EX66.png 'I use Nix by the way')
![Image](https://i.imgur.com/IzOUhrV.png 'Neovim for winter days')
![image](https://i.imgur.com/yuK0FGO.png 'Why not take a look at my files?')
![image](https://i.imgur.com/iTgxn7s.png 'Firefox W')

## My System

### The base environment

I'm running Hyprland, with greetd as a login manager.

#### Desktop environment

- Desktop: [Hyprland](https://github.com/hyprwm/Hyprland 'hyprland')
- Launcher: [anyrun](https://github.com/Kirottu/anyrun 'anyrun')
- Shell: [zsh](http://zsh.sourceforge.net/ 'zsh') configured with [oh-my-posh](https://ohmyposh.dev/), [antidote](https://getantidote.github.io/) and [prezto](https://github.com/sorin-ionescu/prezto)
- Editor: [SnowyVim](https://git.sr.ht/~darumaka/SnowyVim), a custom Neovim configuration made with nixvim
- Bar: [waybar](https://github.com/Alexays/Waybar 'waybar')
<!--- TODO: Add ags --->
- Kernel: [Linux-zen](https://archlinux.org/packages/extra/x86_64/linux-zen/ 'zen')
- Lockscreen and idle: [hypridle](https://github.com/hyprwm/hypridle) and [hyprlock](https://github.com/hyprwm/hyprlock)

### Specialisations

I also use specialisations to configure special system configs that I can switch between at boot:

```nix
# systems/specialise/default.nix
{...}: {
  specialisation = {
 # Config with KDE plasma
    plasma.configuration = {
      imports = [./plasma.nix];
    };
    # Config with hyprland
    hyprland.configuration = {
      imports = [./hyprland.nix];
    };
    # Config with plasma and disables my laptop's builtin display
    plasma-ext-display.configuration = {
      imports = [./plasma.nix ./no-laptop-display.nix];
    };
    # Config with hyprland and disables the builtin display
    hyprland-ext-display.configuration = {
      imports = [./no-laptop-display.nix ./hyprland.nix];
    };
  };
}
```

### Custom options

I use custom made nix modules to configure different hosts and users with added modularity, and ease.

<!--- If I had any that is --->

### Desktop Switching

In configuration.nix

```nix
# systems/(your-system)/configuration.nix
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
# home/(user)/home.nix
# Enable hyprland or sway, it will not work if you enable both at once, unlike in configuration.nix
# They will work whether kde is enabled or not
{
 # Here you can put hyprland or sway
  wayland.compositor = "hyprland";
}
```

### System options

```nix
# systems/(your-system)/configuration.nix
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

### Deploy my config

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

## Resources

### Useful resources

- [NixOS Manual](https://nixos.org/manual/nixos/unstable/ 'nix')
- [Erase your darlings](https://grahamc.com/blog/erase-your-darlings/ 'persist')
- [NixOS wiki](https://nixos.wiki 'nix-wiki')
- [MyNixOS](https://mynixos.com 'Best nix resource')
- [NixOS install guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)

### Inspirations

- [justinlime's waybar configuration](https://github.com/justinlime/dotfiles)
- [D3Ext's aesthetic wallpaper repo](https://github.com/D3Ext/aesthetic-wallpapers 'walls')
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles/ 'fufexan dots')
- [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config 'dots')
- [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs 'nix-starter-configs')

<!---
TODO:
- Update Minecraft config
--->
