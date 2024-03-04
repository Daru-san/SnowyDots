# Firefox theme for this user
{...}: let
  # Fetch css from soulhotel/Perfection-Firefox-CSS-Theme
  src = with builtins;
    fetchGit {
      url = "https://github.com/soulhotel/Perfection-Firefox-CSS-Theme";
      rev = "ef5f4967e2aa0bf8a718c15bf610ba72af862e2b";
    };
in {
  home.file.".mozilla/firefox/daru/chrome" = {
    source = "${src}";
    recursive = true;
  };
}
