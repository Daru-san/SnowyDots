{
  programs.thunderbird = {
    enable = true;
    profiles = {
      gmail = {
        name = "daru-gmail";
      };
      proton = {
        name = "daru-proton";
        isDefault = true;
      };
    };
    settings = {
      "general.useragent.override" = "";
      "privacy.donottrackheader.enabled" = true;
    };
  };
}
