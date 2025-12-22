{
  popups = {
    notifications = {
      enable = true;
      timeout = 3000;
      anchors = [ "top" "right"];
      layer = "overlay";
    };

    osd = {
      enable = true;
      timeout = 2000;

      layer = "overlay";
      orientation = "vertical";

      margins = {
        left = 12;
        right = 13;
      };

      anchors = [ "right" ];
    };
  };
}
