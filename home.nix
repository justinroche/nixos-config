{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./plasma
  ];

  home.stateVersion = "26.05"; # never change

  home.packages = with pkgs; [
    alejandra
    codex
    curl
    devenv
    glow
    kdePackages.krdc
    lazygit
    nerd-fonts.jetbrains-mono
    plexamp
    tree
    vscode
    wget
    wl-clipboard
    xclip
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    bash.enable = true;

    fd = {
      enable = true;
      hidden = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "Justin Roche";
          email = "justinroche03@gmail.com";
        };
        core.editor = "nvim";
      };
    };

    kitty = {
      enable = true;
      themeFile = "tokyo_night_night";
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 12;
      };
      settings = {
        cursor_shape = "beam";
      };
    };

    nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      imports = [./nvim];
    };

    ripgrep = {
      enable = true;
      arguments = [
        "--max-columns=200"
        "--max-columns-preview"
        "--smart-case"
      ];
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      presets = ["pure-preset"];
    };

    tmux = {
      enable = true;
      terminal = "tmux-256color";
      keyMode = "vi";
      prefix = "C-Space";
      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        yank
        {
          plugin = tokyo-night-tmux;
          extraConfig = builtins.readFile ./tmux/tokyo-night.conf;
        }
      ];
      extraConfig = lib.concatStringsSep "\n" [
        (builtins.readFile ./tmux/settings.conf)
        (builtins.readFile ./tmux/keybindings.conf)
      ];
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#justin-xps";
      };

      initContent = lib.concatStringsSep "\n" [
        (builtins.readFile ./zsh/tmux-autostart.zsh)
        (builtins.readFile ./zsh/transient-prompt.zsh)
        (builtins.readFile ./zsh/devenv-hook.zsh)
      ];
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        mgr = {
          show_hidden = true;
          sort_by = "natural";
          sort_dir_first = true;
        };
      };
    };
  };
}
