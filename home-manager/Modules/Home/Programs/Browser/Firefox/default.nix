{pkgs, lib, config, ...}: let

    #Import custom css themes from github
    firefoxOne = pkgs.fetchgit {
      url = "https://github.com/Godiesc/firefox-one";
      rev = "974fee10ce0ebc9b4025b90bb18d05d74c46230f";
      sha256 = "0q4n013iinli1x9s2jwi091wi5qmmqxhljg7sk6sk5fsd6kzvn5p";
    };
    blurredfox = pkgs.fetchgit {
      url = "https://github.com/eromatiya/blurredfox";
      rev = "6976b5460f47bd28b4dc53bd093012780e6bfed3";
      sha256 = "Esgw5GQIfULB+G2+M2f6y/AZEBtUNg3JXGK3I/Y9RFY=";
    };
    firefoxGX = pkgs.fetchgit {
      url = "https://github.com/Godiesc/firefox-gx";
      rev = "218514ac43d7ebcc254ba220a023b9d3cd0b586a";
      sha256 = "BqSBrAZlNYiXl2DxSclPR37oLIHu786XxOsQhnJyfFw=";
    };

    user = "daru";

  #Firefox-nightly overlay setup
  in {
    nixpkgs.overlays =
  let
    # Change this to a rev sha to pin
    moz-rev = "master";
    moz-url = builtins.fetchTarball { url = "https://github.com/mozilla/nixpkgs-mozilla/archive/${moz-rev}.tar.gz";};
    nightlyOverlay = (import "${moz-url}/firefox-overlay.nix");
  in [
    nightlyOverlay
  ];

  #Theme symlinks 
  home.file.".mozilla/firefox/${user}/chrome" = {
    source = "${firefoxOne}/chrome";
    recursive = true;
  };

  programs.firefox = {
    enable = true;

    #Package, firefox-nightly
    package = pkgs.latest.firefox-nightly-bin;

    profiles = {
      ${user} = {
        #Name
        name = "daruFox";

        #Extensions(from NUR)
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          behave
          boring-rss
          cliget
          decentraleyes
          disable-javascript
          don-t-fuck-with-paste
          disconnect
          enhanced-github
          enhancer-for-youtube
          firefox-color
          violentmonkey
          github-file-icons
          gitako-github-file-tree
          i-dont-care-about-cookies
          hover-zoom-plus
          image-search-options
          keepassxc-browser
          multi-account-containers
          no-pdf-download
          re-enable-right-click
          simplelogin
          skip-redirect
          sponsorblock
          stylus
          terms-of-service-didnt-read
          temporary-containers
          translate-web-pages
          ublock-origin
          unpaywall
          web-archives
          widegithub
          tabcenter-reborn
          ];

        #Make this profile the default
        isDefault = true;

        #Search engines
        search = {
          default = "Brave Search";
          force = true;
          engines = {
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
            "Brave Search" = {
              urls = [
              {template = "https://search.brave.com/search?q={searchTerms}";}
              ];
              iconUpdateURL = "https://cdn.search.brave.com/serp/v2/_app/immutable/assets/brave-logo-dark.62301cdf.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@br"];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                  ];
               }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "type"; value = "options"; }
                  { name = "query"; value = "{searchTerms}"; }
                  ];
               }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };
            "Home Manager" = {
              urls = [
                {template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";}                
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@hm"];
            };
            "StartPage" = {
              urls = [
                {template = "https://www.startpage.com/sp/search?query={searchTerms}";}
              ];
              icon = "https://www.startpage.com/sp/cdn/favicons/favicon--default.ico";
              definedAliases = ["@sp"];
            };
          };
        };

        #Settings(in user.js)
        settings = {
          "browser.disableResetPrompt" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "dom.security.https_only_mode" = true;
          "identity.fxaccounts.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "signon.rememberSignons" = true;
          "browser.backspace_action" = 0;
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.download.panel.shown" = false;
          "browser.download.useDownloadDir" = false;
          "browser.newtabpage.activity-stream.feeds.section.highlights" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" =false;
          "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.search.suggest.enabled" = false;
          "browser.toolbars.bookmarks.visibility" = "always";
          "browser.tabs.warnOnClose" = true;
          "browser.startup.page" = 3;
          "browser.translations.panelShown" = true;
          "browser.urlbar.quicksuggest.scenario" = "history";
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.history" = false;
          "browser.urlbar.suggest.topsites" = false;

          "gfx.webrender.all" = true;
          "layers.acceleration.force-enabled" = true;

          "privacy.clearOnShutdown.cache" = true;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.downloads" = false;
          "privacy.clearOnShutdown.history" = true;
          "privacy.clearOnShutdown.sessions" = false;

          "privacy.donottrackheader.enabled" = true;
          "svg.context-properties.content.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "layout.css.color-mix.enabled" = true;
          "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
          "layout.css.backdrop-filter.enabled" = true;

          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "privacy.userContext.longPressBehavior" = 2;

          #Firefox-one configs
          "firefoxone.rhythm_sound_tab" = true;
          "firefoxone.selected_tab_gradient_border" = true;
          "firefoxone.style_without_leftsidebar" = false;
          "firefoxone.tree_tabs_style" = false;
          "firefoxone.without-default-colors" = true;
          "firefoxone.main-image" = false;
          
          #Firefoxgx configs
          "firefoxgx.left-sidebar" = true;
          "firefoxgx.main-image" = false;
        };
      };
    };
  };
}
