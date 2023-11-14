{pkgs, ...}:{
  #User configurations
  users = {
    users = {
    #My main user
    daru = {
      isNormalUser = true;
      defaultShell = pkgs.zsh;
      initialPassword = "NixRebuilt";
      description = "Daru";
      extraGroups = [ "networkmanager" "wheel" "video" "adbusers" "input"];
    };
    #Disables root user
    root.hashedPassword = "!";
    # mutableUsers = false;
    };
  };
}
