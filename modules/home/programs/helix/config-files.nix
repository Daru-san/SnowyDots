{
  lib,
  config,
  vale,
  ...
}:
{
  "vale/.vale.ini" = {
    text = lib.generators.toINIWithGlobalSection { } {
      globalSection = {
        StylesPath = "${vale}/share/vale/styles";
      };
      sections = {
        formats = {
          mdx = "md";
        };
        "*.{md,rst}" = {
          BasedOnStyles = lib.concatStringsSep ", " [
            "proselint"
            "Google"
            "write-good"
            "Vale"
          ];
        };
      };
    };
  };

  "helix/runtime/queries/crates".source = "${config.programs.helix.package}/lib/runtime/queries/toml";
}
