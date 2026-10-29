let
  settings = import ./settings.nix;
in {
  programs.plasma.configFile = {
    # Window placement is handled by KZones, rather than a Kitty-only rule.
    kwinrulesrc.General = {
      count = 0;
      rules = "";
    };

    kwinrc = {
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
  };
}
