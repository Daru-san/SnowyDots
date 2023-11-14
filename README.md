# SnowflakeOS
My flake-based NixOS configuration featuring Hyprland, Sway and many more

## Status
Right now this repo is still in it's early development phase so don't expect much of it

### Note
* This repo is a remake or continuation of an older repo 'Nix-Dots' which will soon be archived
    * In this repo I'll be looking to rebuilt everything from the original from start to finish while leaving the original untouched
    * The reason for this switch is to rebuild the original from scratch with a new template and do what couldn't be done with it's original structure

## TODO:

### To be done:
- [ ] Build the config successfully
- [ ] Implement configuration switching for seperate users and devices
- [ ] Set up shell environments for developing in different languages
- [ ] Create a deploy script
- [ ] Set up custom packages
- [ ] Completely overhaul rofi configuration

### In Progress:
- [ ] Reconfigure home with custom variables
    - [x] Implement color variables
    - [ ] Implement wallpaper variables
    - [ ] Implement shell variables
- [ ] Add nixos modules
    - [x] Add system modules
    - [ ] Add extra modules for hardware configurations
- [ ] Implement global home modules
    - [x] Add user specific modules 
    - [ ] Implement shared modules
- [ ] Finish configuring user environment 
    - [ ] Implement desktop switching 
    - [ ] Implement theme switching
    - [ ] Fix all inconsistensies in home configuration
- [ ] Set up persistence
    - [x] Set up default xdg directories for home
    - [ ] Set up system persistence module 
    - [ ] Set up home persistence module

### Completed
- [x] Add modules to flake
