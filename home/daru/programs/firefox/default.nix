{
  pkgs,
  config,
  inputs,
  ...
}: let
  user = "${config.home.username}";
in {
  imports = [./theme.nix];

  programs.firefox = {
    enable = true;

    #Package, firefox-nightly
    package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;

    profiles = {
      ${user} = {
        #Name
        name = "daruFox";

        #Extensions(from NUR)
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
              urls = [
                {
                  template = "https://search.brave.com/search?q={searchTerms}";
                }
              ];
              iconUpdateURL = "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@br" "@b" "@brave"];
            };

            #StartPage
            "StartPage" = {
              urls = [
                {
                  template = "https://www.startpage.com/sp/search?query={searchTerms}";
                }
              ];
              iconUpdateURL = "https://www.startpage.com/sp/cdn/favicons/favicon-gradient.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@sp" "@s" "@start"];
            };

            #Give google an alias
            "Google" = {
              metaData = {
                alias = "@g";
                hidden = true;
              };
            };

            "DuckDuckGo" = {
              metaData = {
                alias = "@dg";
                hidden = true;
              };
            };

            #Disable Bing
            "Bing" = {metaData = {hidden = true;};};

            #Disable Amazon
            "Amazon.com" = {metaData = {hidden = true;};};

            # Disable wikipedia
            "Wikipedia (en)" = {metaData = {hidden = true;};};

            # Reddit
            "Reddit" = {
              urls = [
                {
                  template = "https://www.reddit.com/search/?q={searchTerms}";
                }
              ];
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
              urls = [
                {
                  template = "https://nixos.wiki/index.php?search={searchTerms}";
                }
              ];
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
              urls = [
                {
                  template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@hm" "@home" "@homeman"];
            };
          };
        };

        #Settings(in user.js)
        settings = {
          "browser.disableResetPrompt" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "dom.security.https_only_mode" = true;
          "identity.fxaccounts.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "signon.rememberSignons" = false;
          "browser.backspace_action" = 0;
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.download.panel.shown" = false;
          "browser.download.useDownloadDir" = false;
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" =
            false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" =
            false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.search.suggest.enabled" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
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

          # Fonts
          "font.name.monospace.x-western" = config.fonts.monospace.name;
          "font.name.sans-serif.x-western" = config.fonts.sansSerif.name;
          "font.name.serif.x-western" = config.fonts.serif.name;
        };
      };
    };
  };
}
