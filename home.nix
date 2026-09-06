{
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "26.05"; # never change

  home.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.xclip
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs = {
    bash.enable = true;

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

    kitty = {
      enable = true;
      themeFile = "tokyo_night_night";
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 12;
      };
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
          extraConfig = ''
            set -g @tokyo-night-tmux_show_datetime 0
            set -g @tokyo-night-tmux_show_path 1
            set -g @tokyo-night-tmux_path_format relative
            set -g @tokyo-night-tmux_window_id_style dsquare
            set -g @tokyo-night-tmux_show_git 0
          '';
        }
      ];
      extraConfig = ''
        set-option -sa terminal-overrides ",xterm*:Tc"
        set -g set-clipboard on

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      '';
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#justin-xps";
      };
      initContent = ''
        if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
          tmux attach -t default || tmux new -s default
        fi
      '';
    };
  };
}
