{ config, pkgs, ... }:
let
  CURSOR_PKG = pkgs.bibata-cursors;
  CURSOR_THEME = "Bibata-Modern-Ice";
  CURSOR_SIZE = 24;
in
{
  home.pointerCursor = {
    name = CURSOR_THEME;
    package = CURSOR_PKG;
    size = CURSOR_SIZE;
  };

  # Apply to GTK applications
  gtk.cursorTheme = {
    name = CURSOR_THEME;
    package = CURSOR_PKG;
    size = CURSOR_SIZE;
  };

  # Apply to X applications (for compatibility)
  xresources.properties = {
    "Xcursor.theme" = CURSOR_THEME;
    "Xcursor.size" = "${toString CURSOR_SIZE}";
  };

  # Apply settings immediately
  home.sessionVariables = {
    XCURSOR_THEME = CURSOR_THEME;
    XCURSOR_SIZE = "${toString CURSOR_SIZE}";
  };
}
