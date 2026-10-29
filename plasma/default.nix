{config, ...}: let
  settings = import ./settings.nix;
in {
  programs.plasma = {
    enable = true;
    configFile.kdeglobals.Sounds.Theme = "PS5";
    # Window placement is handled by KZones, rather than a Kitty-only rule.
    configFile.kwinrulesrc.General = {
      count = 0;
      rules = "";
    };
    configFile.kwinrc = {
      Plugins = {
        kzonesEnabled = true;
        tileseditorEnabled = false;
      };
      "Script-kzones" = {
        enableZoneOverlay = true;
        rememberWindowGeometries = true;
        layoutsJson = {
          escapeValue = false;
          value = builtins.toJSON [
            {
              name = "Centered";
              padding = 4;
              zones = [settings.zones.centered];
            }
          ];
        };
      };
    };
    workspace.wallpaperSlideShow = {
      path = "${config.home.homeDirectory}/${settings.wallpaper.directory}";
      interval = settings.wallpaper.interval;
    };
    panels = [
      {
        location = "bottom";
        widgets = [
          {kickoff = {};}
          "org.kde.plasma.pager"
          {
            iconTasks.launchers = settings.panel.launchers;
          }
          {
            plasmaPanelColorizer = {
              general = {
                enable = true;
                hideWidget = true;
              };
              settings.General.globalSettings = builtins.toJSON {
                panel.normal = {
                  enabled = true;
                  backgroundColor = {
                    enabled = true;
                    custom = settings.panel.color;
                    sourceType = 0;
                    alpha = 1.0;
                  };
                };
                nativePanel.background = {
                  enabled = false;
                  shadow = false;
                };
              };
            };
          }
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];
  };
}
