{
  programs.thunderbird = {
    enable = true;
    profiles = {
      gmail = {};
      proton = {
        isDefault = true;
      };
    };
    settings = {
      "general.useragent.override" = "";
      "privacy.donottrackheader.enabled" = true;
    };
  };
}
