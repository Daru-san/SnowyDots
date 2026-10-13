{
  config,
  ...
}:
let
  colors = config.stylix.generated.palette;
  fonts = config.stylix.fonts;
in
{
  wayland.windowManager.mango.settings =
    let
      hex = color: "0x${color}ff";
      alpha = color: alpha: "0x${color}${alpha}";
    in
    {

      jump_label_decorate_font_desc = "${fonts.sansSerif.name} 16";
      group_bar_decorate_font_desc = "${fonts.sansSerif.name} 16";
      tab_bar_decorate_font_desc = "${fonts.sansSerif.name} 12";
      root_color = hex colors.base00;
      border_color = hex colors.base03;
      drop_color = "0x${colors.base00}55";
      split_color = hex colors.base0D;
      focus_color = hex colors.base0D;
      urgent_color = hex colors.base08;
      maximized_screen_color = hex colors.base0B;
      scratchpad_color = hex colors.base0C;
      global_color = hex colors.base0E;
      overlay_color = hex colors.base0C;
      jump_label_decorate_fg_color = hex colors.base05;
      jump_label_decorate_bg_color = hex colors.base01;
      jump_label_decorate_focus_fg_color = hex colors.base00;
      jump_label_decorate_focus_bg_color = hex colors.base0D;
      jump_label_decorate_border_color = hex colors.base0D;
      group_bar_decorate_fg_color = hex colors.base05;
      group_bar_decorate_bg_color = hex colors.base01;
      group_bar_decorate_focus_fg_color = hex colors.base00;
      group_bar_decorate_focus_bg_color = hex colors.base0D;
      group_bar_decorate_border_color = hex colors.base0D;
      tab_bar_decorate_fg_color = hex colors.base05;
      tab_bar_decorate_bg_color = alpha colors.base01 "20";
      tab_bar_decorate_focus_fg_color = hex colors.base05;
      tab_bar_decorate_focus_bg_color = alpha colors.base0D "60";
      tab_bar_decorate_border_color = alpha colors.base0D "40";
    };
}
