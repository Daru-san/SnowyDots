# Shared firefox configuration
{
  pkgs,
  config,
  inputs,
  ...
}: let
  # Fetch custom css from christorange/VerticalFox on github
  userChrome = with pkgs;
    fetchgit {
      url = "https://github.com/christorange/VerticalFox";
      rev = "29d7ee3f320bc52bb928a1b0ba82457a6583fbfe";
      sha256 = "Mua9eBbAEisch3YhgdzkXLZTfL1x+wXqq1u8tcvsOC0=";
    }
    + "/windows/userChrome.css";
in {
  programs.firefox = {
    enable = true;

    # Package, firefox-nightly
    package = with inputs.firefox.packages.${pkgs.system}; firefox-nightly-bin;

    inherit userChrome;

    profiles.${config.home.username} = {
      # Extensions(from NUR)
      extensions = with config.nur.repos.rycee.firefox-addons;
        [
          boring-rss
          disable-javascript
          don-t-fuck-with-paste
          enhanced-github
          violentmonkey
          foxytab
          github-file-icons
          gitako-github-file-tree
          hover-zoom-plus
          image-search-options
          keepassxc-browser
          multi-account-containers
          no-pdf-download
          re-enable-right-click
          simplelogin
          skip-redirect
          temporary-containers
          ublock-origin
          widegithub
          auto-tab-discard
          dark-mode-webextension
          lovely-forks
          tabliss
          vimium-c
        ]
        ++ (with config.nur.repos.bandithedoge.firefoxAddons; [sidebery]);

      # Make this profile the default
      isDefault = true;

      # Containers
      containers = {
        general = {
          color = "blue";
          id = 1;
          icon = "fruit";
        };
        shopping = {
          color = "pink";
          id = 2;
          icon = "cart";
        };
        dev = {
          color = "green";
          id = 3;
          icon = "chill";
        };
        social = {
          color = "red";
          id = 4;
          icon = "pet";
        };
        mail = {
          color = "orange";
          id = 5;
          icon = "fingerprint";
        };
        nix = {
          color = "blue";
          id = 6;
          icon = "circle";
        };
        privacy = {
          color = "green";
          id = 7;
          icon = "briefcase";
        };
        reading = {
          color = "turquoise";
          id = 8;
          icon = "tree";
        };
        account = {
          color = "toolbar";
          id = 9;
          icon = "fingerprint";
        };
        money = {
          color = "yellow";
          id = 10;
          icon = "dollar";
        };
        misc = {
          color = "yellow";
          id = 69;
          icon = "circle";
        };
        space = {
          color = "purple";
          id = 77;
          icon = "vacation";
        };
      };

      # Search engines
      search = {
        # Make Brave and StartPage defaults
        default = "Brave Search";
        privateDefault = "StartPage";

        order = [
          "Brave Search"
          "StartPage"
          "Github"
          "Reddit"
          "My NixOS"
          "NixOS Wiki"
          "Nix Packages"
          "Nix Options"
          "Home Manager"
        ];

        # Force apply configs
        force = true;

        # Add custom search engines and modify existing ones
        engines = {
          #Brave search
          "Brave Search" = {
            urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
            iconUpdateURL = "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@br" "@b" "@brave"];
          };

          #StartPage
          "StartPage" = {
            urls = [{template = "https://www.startpage.com/sp/search?query={searchTerms}";}];
            iconUpdateURL = "https://www.startpage.com/sp/cdn/favicons/favicon-gradient.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@sp" "@s" "@start"];
          };

          # Disable a bunch of search engines
          "Google" = {metaData = {hidden = true;};};
          "DuckDuckGo" = {metaData = {hidden = true;};};
          "Bing" = {metaData = {hidden = true;};};
          "Amazon.com" = {metaData = {hidden = true;};};
          "Wikipedia (en)" = {metaData = {hidden = true;};};

          # Reddit
          "Reddit" = {
            urls = [{template = "https://www.reddit.com/search/?q={searchTerms}";}];
            iconUpdateURL = "https://www.redditstatic.com/shreddit/assets/favicon/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@r" "@reddit"];
          };

          # Github
          "Github" = {
            urls = [{template = "https://github.com/search?q={searchTerms}";}];
            iconUpdateURL = "https://github.githubassets.com/assets/pinned-octocat-093da3e6fa40.svg";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@gh" "@g" "@git"];
          };

          # Add the NixOS wiki
          "NixOS Wiki" = {
            urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
            iconUpdateURL = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["@nw" "@nixwiki"];
          };

          # Nix packages and options from search.nixos.org
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np" "@nixpkgs"];
          };
          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "type";
                    value = "options";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@no" "@nixopts"];
          };

          # Similiar to search.nixos.org but with more info
          "My NixOS" = {
            urls = [{template = "https://mynixos.com/search?q={searchTerms}";}];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
            definedAliases = ["@mn" "@nx" "@mynixos"];
          };

          #Home manager search
          "Home Manager" = {
            urls = [{template = "https://home-manager-options.extranix.com/?query={searchTerms}";}];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@hm" "@home" "@homeman"];
          };
        };
      };

      settings = {
        "browser.disableResetPrompt" = true;
        "browser.bookmarks.showMobileBookmarks" = false;
        "browser.download.panel.shown" = false;
        "browser.download.useDownloadDir" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.search.suggest.enabled" = false;
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
        "privacy.clearOnShutdown.downloads" = true;
        "privacy.clearOnShutdown.history" = false;
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
      };
    };
    policies = {
      DisableAppUpdate = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableProfileImport = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DNSOverHTTPS = {
        Enabled = true;
        Locked = true;
      };
      DontCheckDefaultBrowser = true;
      ExtensionUpdate = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };
      HardwareAcceleration = true;
      NoDefaultBookmarks = true;
      OverrideFirstRunPage = "";
      PopupBlocking = {Default = true;};
      Preferences = {
        browser.backspace_action = 0;
      };
    };
  };
}
