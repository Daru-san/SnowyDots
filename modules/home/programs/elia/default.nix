{ inputs, ... }:
{
  imports = [ inputs.snowpkgs.homeManagerModules.default ];
  programs.elia = {
    enable = true;
    settings = {
      default_model = "gemini-main";
      theme = "nautilus";
      models = [
        {
          id = "gemini-main";
          name = "gemini/gemini-1.5-flash-latest";
          display_name = "Gemini Flash";
        }
        {
          id = "gemini-2";
          name = "gemini/gemini-1.5-pro-latest";
          display_name = "Gemini Pro";
        }
      ];
    };
  };
}
