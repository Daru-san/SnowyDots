 # {pkgs, ...}:{
#   gtk = {
#     enable = true;
#
#     theme = {
#     };
#
#     iconTheme = {
#       name = "Papirus-Dark";
#       package = pkgs.papirus-icon-theme;
#     };
#    };
#   dconf.settings = {
#     # Make gtk apps follow a dark theme
#     "org/gnome/desktop/interface" = {
#       color-scheme = "prefer-dark";
#     };
#     # Remove buttons in gtk apps
#     "org/gnome/desktop/wm/preferences" = {
#       button-layout = "appmenu";
#     };
#   };
# }
