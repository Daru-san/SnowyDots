{
  inputs,
  config,
  ...
}: {
  imports = [./qt.nix ./fonts.nix ./gtk.nix ./wallpaper.nix];

  # Colorscheme from nix-colors
  colorScheme = inputs.nix-colors.colorSchemes.oxocarbon-dark;
  # Converting the colorscheme to css
  colorSchemeCss = with config.colorScheme.palette; ''
    @define-color base00 #${base00}; /*#161616*/
    @define-color base01 #${base01}; /*#262626*/
    @define-color base02 #${base02}; /*#393939*/
    @define-color base03 #${base03}; /*#525252*/
    @define-color base04 #${base04}; /*#dde1e6*/
    @define-color base05 #${base05}; /*#f2f4f8*/
    @define-color base06 #${base06}; /*#ffffff*/
    @define-color base07 #${base07}; /*#08bdba*/
    @define-color base08 #${base08}; /*#3ddbd9*/
    @define-color base09 #${base09}; /*#78a9ff*/
    @define-color base0A #${base0A}; /*#ee5396*/
    @define-color base0B #${base0B}; /*#33b1ff*/
    @define-color base0C #${base0C}; /*#ff7eb6*/
    @define-color base0D #${base0D}; /*#42be65*/
    @define-color base0E #${base0E}; /*#be95ff*/
    @define-color base0F #${base0F}; /*#82cfff*/
  '';
}
