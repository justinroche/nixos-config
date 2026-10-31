{...}: {
  plugins = {
    comment.enable = true;
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          nix = ["alejandra"];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
      };
    };
    bufferline = {
      enable = true;
      settings.options = {
        always_show_bufferline = true;
        diagnostics = "nvim_lsp";
        modified_icon = "●";
        separator_style = "slant";
      };
    };
    gitsigns.enable = true;
    lualine.enable = true;
    nvim-surround.enable = true;
    telescope = {
      enable = true;
      settings.pickers = {
        find_files.hidden = true;
        live_grep.hidden = true;
      };
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
    };
    web-devicons.enable = true;
    which-key.enable = true;
    yazi = {
      enable = true;
      settings = {
        floating_window_scaling_factor = 0.9;
        yazi_floating_window_border = "rounded";
      };
    };
  };
}
