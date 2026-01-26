{
  pkgs,
  config,
  ...
}:
{
  stylix.targets.floorp = {
    profileNames = [ config.home.username ];
  };
  programs.floorp = {
    enable = true;
    nativeMessagingHosts = with pkgs; [ tridactyl-native ];

    profiles.${config.home.username} = {
      isDefault = true;

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
        default = "StartPage";
        privateDefault = "StartPage";

        order = [
          "qwant"
          "Brave Search"
          "ddg"
          "StartPage"
          "Github"
          "reddit"
          "My NixOS"
          "Noogle"
          "ArchLinux Wiki"
          "NixOS Wiki"
          "Nix Packages"
          "Nix Options"
          "Home Manager"
          "Nixvim Options"
          "Crates.io"
          "Docs.rs"
        ];

        engines =
          let
            disabled.metaData.hidden = true;
          in
          {
            "google" = {
              inherit (disabled) metaData;
            };
            "bing" = {
              inherit (disabled) metaData;
            };
            "amazondotcom-us" = {
              inherit (disabled) metaData;
            };
            "wikipedia" = {
              inherit (disabled) metaData;
            };
            "ddg" = {
              metaData.alias = "@dg";
            };

            "qwant" = {
              urls = [ { template = "https://www.qwant.com/?q={searchTerms}"; } ];
              icon = "https://www.qwant.com/favicon.ico";
              definedAliases = [
                "@qw"
                "@qwant"
              ];
            };

            "Brave Search" = {
              urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
              icon = "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@br"
                "@b"
                "@brave"
              ];
            };

            "StartPage" = {
              urls = [ { template = "https://www.startpage.com/sp/search?query={searchTerms}"; } ];
              icon = "https://www.startpage.com/sp/cdn/favicons/favicon-gradient.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@sp"
                "@s"
                "@start"
              ];
            };

            "reddit" = {
              urls = [ { template = "https://www.reddit.com/search/?q={searchTerms}"; } ];
              icon = "https://www.redditstatic.com/shreddit/assets/favicon/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@r"
                "@reddit"
              ];
            };

            "Github" = {
              urls = [ { template = "https://github.com/search?q={searchTerms}"; } ];
              icon = "https://github.githubassets.com/assets/pinned-octocat-093da3e6fa40.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@gh"
                "@g"
                "@git"
              ];
            };

            "Crates.io" = {
              urls = [ { template = "https://crates.io/search?q={searchTerms}"; } ];
              icon = "https://crates.io/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@cargo"
                "@cg"
                "@crates"
              ];
            };

            "Docs.rs" = {
              urls = [ { template = "https://docs.rs/releases/search?query={searchTerms}"; } ];
              icon = "https://docs.rs/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@docsrs"
                "@rsdoc"
                "@rustdoc"
                "@doc"
              ];
            };

            "ArchLinux Wiki" = {
              urls = [ { template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; } ];
              icon = "https://wiki.archlinux.org/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@archwiki"
                "@arch"
                "@aw"
              ];
            };

            "NixOS Wiki" = {
              urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
              icon = "https://wiki.nixos.org/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@nw"
                "@nixwiki"
              ];
            };

            "Noogle" = {
              urls = [ { template = "https://noogle.dev/q?term={searchTerms}"; } ];
              icon = "https://noogle.dev/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@noogle"
                "@ng"
              ];
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
              definedAliases = [
                "@np"
                "@nixpkgs"
              ];
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
              definedAliases = [
                "@no"
                "@nixopts"
              ];
            };

            "My NixOS" = {
              urls = [ { template = "https://mynixos.com/search?q={searchTerms}"; } ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
              definedAliases = [
                "@mn"
                "@nx"
                "@mynixos"
              ];
            };

            "Home Manager" = {
              urls = [
                { template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master"; }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [
                "@hm"
                "@home"
                "@homeman"
              ];
            };

            "Nixvim Options" = {
              urls = [ { template = "https://nix-community.github.io/nixvim/search/?query={searchTerms}"; } ];
              icon = "https://nix-community.github.io/nixvim/search/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [
                "@nxv"
                "@nv"
                "@nvo"
              ];
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

        "general.smoothScroll" = true;
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

        "userContent.page.proton_color.system_accent" = true;
        "widget.non-native-theme.use-theme-accent" = true;

        "cookiebanners.service.mode" = 2;
        "cookiebanners.service.mode.privateBrowsing" = 2;

        "nglayout.initialpaint.delay" = 0;
        "nglayout.initialpaint.delay_in_oopif" = 0;
        "content.notify.interval" = 100000;
        "browser.startup.preXulSkeletonUI" = false;

        "gfx.webrender.precache-shaders" = true;
        "layers.gpu-process.enabled" = true;
        "gfx.canvas.accelerated" = true;
        "gfx.canvas.accelerated.cache-items" = 32768;
        "gfx.canvas.accelerated.cache-size" = 4096;
        "dom.ipc.processCount" = 1;
        "fission.autostart" = false;
        "browser.cache.disk.capacity" = 0;
        "browser.cache.disk.enable" = false;
        "layers.mlgpu.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "dom.ipc.processCount.webIsolated" = 1;

        "sidebar.verticalTabs" = true;
        "sidebar.expandOnHover" = true;
        "sidebar.animation.expand-on-hover.duration-ms" = 0;

        "floorp.Tree-type.verticaltab.optimization" = true;
        "floorp.browser.nora.csk.data" = "{}";
        "floorp.browser.note.backup.latest.time" = "1731912540255";
        "floorp.browser.sidebar.enable" = false;
        "floorp.browser.sidebar.is.displayed" = false;
        "floorp.browser.ssb.enabled" = true;
        "floorp.browser.ssb.toolbars.disabled" = true;
        "floorp.browser.user.interface" = 8;
        "floorp.browser.workspace.showWorkspaceName" = false;
        "floorp.browser.workspaces.enabled" = false;
        "floorp.downloading.red.color" = false;
        "floorp.legacy.dlui.enable" = true;
        "floorp.navbar.bottom" = true;
        "floorp.search.top.mode" = false;
        "floorp.tabbar.style" = 2;
        "floorp.tabsleep.enabled" = true;
        "floorp.verticaltab.paddingtop.enabled" = true;
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
      OverrideFirstRunPage = "";
      PopupBlocking = {
        Default = true;
      };
      Preferences = {
        "browser.backspace_action" = 0;
        "privacy.trackingprotection.enabled" = true;
        "media.peerconnection.ice.default_address_only" = true;
        "network.captive-portal-service.enabled" = false;
        "network.dns.echconfig.enabled" = true;
        "network.dns.http3_echconfig.enabled" = true;
        "geo.enabled" = false;
        "webgl.disabled" = true;
        "extensions.autoDisableScopes" = false;
        "extensions.update.autoUpdateDefault" = false;
        "extensions.update.enabled" = false;
      };

      ExtensionSettings =
        let
          installation_mode = "force_installed";
          urlPrefix = x: "http://addons.mozilla.org/firefox/downloads/latest/${x}/latest.xpi";
        in
        {
          "uBlock0@raymondhill.net" = {
            install_url = urlPrefix "ublock-origin";
            inherit installation_mode;
          };
          "contact@maxhu.dev" = {
            install_url = urlPrefix "mtab";
            inherit installation_mode;
          };
          "tridactyl.vim@cmcaine.co.uk" = {
            install_url = urlPrefix "tridactyl-vim";
            inherit installation_mode;
          };
          "{92e6fe1c-6e1d-44e1-8bc6-d309e59406af}" = {
            install_url = urlPrefix "hover-zoom-plus";
            inherit installation_mode;
          };
          "keepassxc-browser@keepassxc.org" = {
            install_url = urlPrefix "keepasscx-browser";
            inherit installation_mode;
          };
          "jid1-xUfzOsOFlzSOXg@jetpack" = {
            install_url = urlPrefix "reddit-enhancement-suite";
            inherit installation_mode;
          };
          "{72742915-c83b-4485-9023-b55dc5a1e730}" = {
            install_url = urlPrefix "wide-github";
            inherit installation_mode;
          };
          "{e58d3966-3d76-4cd9-8552-1582fbc800c1}" = {
            install_url = urlPrefix "buster-captcha-solver";
            inherit installation_mode;
          };
          "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = {
            install_url = urlPrefix "github-file-icons";
            inherit installation_mode;
          };
          "bing@search.mozilla.org".installation_mode = "blocked";
        };
    };
  };
}
