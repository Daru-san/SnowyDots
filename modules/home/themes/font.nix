# Module from https://github.com/danth/stylix/
{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) types mdDoc mkOption;
  fontType = types.submodule {
    options = {
      package = mkOption {
        description = mdDoc "Package providing the font.";
        type = types.package;
      };

      name = mkOption {
        description = mdDoc "Name of the font within the package.";
        type = types.str;
      };
    };
  };
in {
  options.fonts = {
    serif = mkOption {
      description = mdDoc "Serif font.";
      type = fontType;
      default = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    sansSerif = mkOption {
      description = mdDoc "Sans-serif font.";
      type = fontType;
      default = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
    };

    monospace = mkOption {
      description = mdDoc "Monospace font.";
      type = fontType;
      default = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };
    };

    extraFonts = mkOption {
      description = mdDoc "Extra font packages to install";
      type = with types; listOf package;
      default = [];
      defaultText = lib.literalExpression "[ ]";
    };

    sizes = {
      desktop = mkOption {
        description = mdDoc ''
          The font size used in window titles/bars/widgets elements of
          the desktop.
        '';
        type = types.ints.unsigned;
        default = 10;
      };

      applications = mkOption {
        description = mdDoc ''
          The font size used by applications.
        '';
        type = types.ints.unsigned;
        default = 12;
      };

      terminal = mkOption {
        description = mdDoc ''
          The font size for terminals/text editors.
        '';
        type = types.ints.unsigned;
        default = 11;
      };
    };
  };
}
