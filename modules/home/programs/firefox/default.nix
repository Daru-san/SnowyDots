{
  pkgs,
  config,
  system,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.tridactyl-native];

    profiles.${config.home.username} = {
      isDefault = true;
      userChrome = builtins.readFile ./userChrome.css;
      extensions = with inputs.firefox-addons.packages.${system}; [
        keepassxc-browser
        multi-account-containers
        auto-tab-discard
        buster-captcha-solver
        violentmonkey
        github-file-icons
        widegithub
        hover-zoom-plus
      ];

      bookmarks = [
        {
          name = "Dev Docs";
          tags = ["docs"];
          keyword = "devdocs";
          url = "https://devdocs.io";
        }
        {
          name = "Linux Kernel";
          tags = ["kernel"];
          keyword = "kernel";
          url = "https://kernel.org";
        }
      ];

      containersForce = true;
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

      search = {
        force = true;
        default = "Brave Search";
        privateDefault = "DuckDuckGo";

        order = [
          "Brave Search"
          "DuckDuckGo"
          "StartPage"
          "Github"
          "Reddit"
          "My NixOS"
          "Noogle"
          "ArchLinux Wiki"
          "NixOS Wiki"
          "Nix Packages"
          "Nix Options"
          "Home Manager"
        ];

        engines = let
          disabled.metaData.hidden = true;
        in {
          "Google" = {inherit (disabled) metaData;};
          "Bing" = {inherit (disabled) metaData;};
          "Amazon.com" = {inherit (disabled) metaData;};
          "Wikipedia (en)" = {inherit (disabled) metaData;};
          "DuckDuckGo" = {metaData.alias = "@dg";};

          "Brave Search" = {
            urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
            iconUpdateURL = "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@br" "@b" "@brave"];
          };

          "StartPage" = {
            urls = [{template = "https://www.startpage.com/sp/search?query={searchTerms}";}];
            iconUpdateURL = "https://www.startpage.com/sp/cdn/favicons/favicon-gradient.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@sp" "@s" "@start"];
          };

          "Reddit" = {
            urls = [{template = "https://www.reddit.com/search/?q={searchTerms}";}];
            iconUpdateURL = "https://www.redditstatic.com/shreddit/assets/favicon/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@r" "@reddit"];
          };

          "Github" = {
            urls = [{template = "https://github.com/search?q={searchTerms}";}];
            iconUpdateURL = "https://github.githubassets.com/assets/pinned-octocat-093da3e6fa40.svg";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@gh" "@g" "@git"];
          };

          "ArchLinux Wiki" = {
            urls = [{template = "https://wiki.archlinux.org/index.php?search={searchTerms}";}];
            iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@archwiki" "@arch" "@aw"];
          };

          "NixOS Wiki" = {
            urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
            iconUpdateURL = "https://wiki.nixos.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@nw" "@nixwiki"];
          };

          "Noogle" = {
            urls = [{template = "https://noogle.dev/q?term={searchTerms}";}];
            iconUpdateUrl = "https://noogle.dev/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@noogle" "@ng"];
          };

          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
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
                    name = "channel";
                    value = "unstable";
                  }
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

          "My NixOS" = {
            urls = [{template = "https://mynixos.com/search?q={searchTerms}";}];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
            definedAliases = ["@mn" "@nx" "@mynixos"];
          };

          "Home Manager" = {
            urls = [{template = "https://home-manager-options.extranix.com/?query={searchTerms}";}];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@hm" "@home" "@homeman"];
          };
        };
      };

      settings = {
        "general.config.sandbox_enabled" = false;
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
        "browser.urlbar.trimHttps" = true;
        "browser.urlbar.trimURLs" = true;
        "browser.urlbar.formatting.enabled" = true;
        "browser.autofocus" = true;

        "extensions.autoDisableScope" = false;

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

        "general.smoothScroll.lines.durationMaxMS" = 125;
        "general.smoothScroll.lines.durationMinMS" = 125;
        "general.smoothScroll.mouseWheel.durationMaxMS" = 200;
        "general.smoothScroll.mouseWheel.durationMinMS" = 100;
        "general.smoothScroll.msdPhysics.enabled" = true;
        "general.smoothScroll.other.durationMaxMS" = 125;
        "general.smoothScroll.other.durationMinMS" = 125;
        "general.smoothScroll.pages.durationMaxMS" = 125;
        "general.smoothScroll.pages.durationMinMS" = 125;

        "mousewheel.min_line_scroll_amount" = 30;
        "mousewheel.system_scroll_override_on_root_content.enabled" = true;
        "mousewheel.system_scroll_override_on_root_content.horizontal.factor" = 175;
        "mousewheel.system_scroll_override_on_root_content.vertical.factor" = 175;
        "toolkit.scrollbox.horizontalScrollDistance" = 6;
        "toolkit.scrollbox.verticalScrollDistance" = 2;

        "widget.use-xdg-desktop-portal" = 1;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "widget.use-xdg-desktop-portal.kde" = 1;
        "GTK_USE_PORTAL" = 1;

        "userContent.page.proton_color.system_accent" = true;
        "widget.non-native-theme.use-theme-accent" = true;

        "cookiebanners.service.mode" = 2;
        "cookiebanners.service.mode.privateBrowsing" = 2;
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
        "browser.backspace_action" = 0;
        "privacy.trackingprotection.enabled" = true;
        "media.peerconnection.ice.default_address_only" = true;
        "network.captive-portal-service.enabled" = false;
        "network.dns.echconfig.enabled" = true;
        "network.dns.http3_echconfig.enabled" = true;
        "geo.enabled" = false;
        "webgl.disabled" = true;
      };

      ExtensionSettings = let
        installation_mode = "force_installed";
        urlPrefix = x: "http://addons.mozilla.org/firefox/downloads/latest/${x}/latest.xpi";
      in {
        "uBlock0@raymondhill.net" = {
          install_url = urlPrefix "ublock-origin";
          inherit installation_mode;
        };
        "{e0de5ee2-4619-413a-8300-a43a90196a6d}" = {
          install_url = urlPrefix "simplerentfox";
          inherit installation_mode;
        };
        "{3c078156-979c-498b-8990-85f7987dd929}" = {
          install_url = urlPrefix "sidebery";
          inherit installation_mode;
        };
        "{47bf427e-c83d-457d-9b3d-3db4118574bd}" = {
          install_url = urlPrefix "nighttab";
          inherit installation_mode;
        };
        "tridactyl.vim@cmcaine.co.uk" = {
          install_url = urlPrefix "tridactyl-vim";
          inherit installation_mode;
        };
        "bing@search.mozilla.org".installation_mode = "blocked";
      };
    };
  };
}
