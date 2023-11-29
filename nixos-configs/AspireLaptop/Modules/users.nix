{ pkgs, ... }: {
  #User configurations
  users = {
    users = {
      #My main user
      daru = {
        isNormalUser = true;
        shell = pkgs.zsh;
        initialPassword = "Zakoru";
        description = "Daru";
        extraGroups = [ "networkmanager" "wheel" "video" "adbusers" "input"];
      };
      #Disables root user
      root.hashedPassword = "!";
    };
    mutableUsers = true;
  };
}
