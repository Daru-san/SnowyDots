{ lib, ... }:
{
  defaultApplications = lib.zipAttrsWith (_: values: values) (
    let
      subtypes =
        type: program: subtype:
        builtins.listToAttrs (
          map (x: {
            name = type + "/" + x;
            value = program;
          }) subtype
        );
    in
    [
      {
        "application/pdf" = "sioyek.desktop";
        "text/html" = "zen-beta.desktop";
      }
      (subtypes "x-scheme-handler" "zen-beta.desktop" [
        "http"
        "https"
        "about"
        "unknown"
      ])
      (subtypes "image" "oculante.desktop" [
        "png"
        "jpeg"
        "gif"
        "apng"
        "avif"
        "bmp"
        "vnd.microsoft.icon"
        "svg+xml"
        "tiff"
        "webp"
        "svg"
      ])
      (subtypes "video" "mpv.desktop" [
        "3gpp"
        "h261"
        "jpeg"
        "mp4"
        "mpeg"
        "ogg"
        "quicktime"
        "webm"
        "x-matroska"
      ])
      (subtypes "audio" "audacious.desktop" [
        "basic"
        "L24"
        "mpeg"
        "mp4"
        "x-aiff"
        "x-mpegurl"
        "vnd.rn-realaudio"
        "ogg"
        "vorbis"
        "vnd.wav"
      ])
      (subtypes "application" "sioyek.desktop" [
        "vnd.comicbook+zip"
      ])
      { "text/plain" = "neovide.desktop"; }
    ]
  );
}
