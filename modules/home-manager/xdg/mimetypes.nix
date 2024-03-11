{...}: {
  xdg.mimeApps = {
    defaultApplications = {
      "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
      "image/*" = ["pqiv.desktop"];
      "video/*" = ["mpv.desktop"];
      "audio/*" = ["music-player.desktop"];
    };
  };
}
