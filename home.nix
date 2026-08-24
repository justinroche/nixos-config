{
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "26.05"; # never change

  home.packages = [];

  home.file = {};

  home.sessionVariables = {};

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Justin Roche";
          email = "justinroche03@gmail.com";
        };
        core.editor = "vim";
      };
    };

    bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#justin-xps";
      };
    };
  };
}
