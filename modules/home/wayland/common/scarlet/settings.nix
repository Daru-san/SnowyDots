{
  popups = {
    notifications = {
      enable = true;
      timeout = 3000;
      anchors = [ "top" ];
      layer = "overlay";
    };

    osd = {
      enable = true;
      timeout = 2000;

      layer = "overlay";
      margins = {

        orientation = "horizontal";

        bottom = 80;
        top = 10;
        left = 12;
        right = 13;
      };

      anchors = [ "bottom" ];
    };
  };
}
