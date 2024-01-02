{ pkgs, ... }: {
  #User configurations
  users = {
    users = {
      #My main user
      daru = {
        isNormalUser = true;
        shell = pkgs.zsh;
        description = "Daru";
        extraGroups = [ "networkmanager" "wheel" "video" "adbusers" "input"];
      };
      #Disables root user
      root.hashedPassword = "!";
    };
    mutableUsers = true;
  };
  fonts.packages = with pkgs; [
    monocraft
    minecraftia
  ];
}
