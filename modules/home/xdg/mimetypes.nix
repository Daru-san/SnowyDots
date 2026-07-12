{ lib, ... }:
{
  defaultApplications = lib.zipAttrsWith (_: values: values) (
    let
      subtypes =
        type: program: subtype:
        builtins.listToAttrs (
          builtins.map (x: {
            name = type + "/" + x;
            value = program;
          }) subtype
        );
    in
    [
      {
        "application/pdf" = "sioyek.desktop";
      }
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
