{pkgs, ...}:{
  home.packages = with pkgs; [
    #Lutris
    (lutris.override {
       extraPkgs = pkgs: [
        #Lutris dependancies
         ryujinx
         citra-canary
         desmume
       ];
    })
  ];
}
