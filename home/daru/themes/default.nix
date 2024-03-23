{
  nix-colors,
  config,
  ...
}: {
  imports = [./qt.nix ./fonts.nix ./gtk.nix];

  # Colorscheme from nix-colors
  colorScheme = nix-colors.colorSchemes.oxocarbon-dark;
  # Converting the colorscheme to css
  colorSchemeCss = ''
    @define-color base00 ${config.colorScheme.colors.base00}; /*#161616*/
    @define-color base01 ${config.colorScheme.colors.base01}; /*#262626*/
    @define-color base02 ${config.colorScheme.colors.base02}; /*#393939*/
    @define-color base03 ${config.colorScheme.colors.base03}; /*#525252*/
    @define-color base04 ${config.colorScheme.colors.base04}; /*#dde1e6*/
    @define-color base05 ${config.colorScheme.colors.base05}; /*#f2f4f8*/
    @define-color base06 ${config.colorScheme.colors.base06}; /*#ffffff*/
    @define-color base07 ${config.colorScheme.colors.base07}; /*#08bdba*/
    @define-color base08 ${config.colorScheme.colors.base08}; /*#3ddbd9*/
    @define-color base09 ${config.colorScheme.colors.base09}; /*#78a9ff*/
    @define-color base0A ${config.colorScheme.colors.base0A}; /*#ee5396*/
    @define-color base0B ${config.colorScheme.colors.base0B}; /*#33b1ff*/
    @define-color base0C ${config.colorScheme.colors.base0C}; /*#ff7eb6*/
    @define-color base0D ${config.colorScheme.colors.base0D}; /*#42be65*/
    @define-color base0E ${config.colorScheme.colors.base0E}; /*#be95ff*/
    @define-color base0F ${config.colorScheme.colors.base0F}; /*#82cfff*/
  '';
}
