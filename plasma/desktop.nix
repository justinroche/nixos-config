{config, ...}: let
  settings = import ./settings.nix;
in {
  programs.plasma = {
    configFile.kdeglobals.Sounds.Theme = "PS5";

    workspace.wallpaperSlideShow = {
      path = "${config.home.homeDirectory}/${settings.wallpaper.directory}";
      interval = settings.wallpaper.interval;
    };
  };
}
