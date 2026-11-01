{...}: {
  plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings.completion.documentation.auto_show = true;
    };
    comment.enable = true;
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          css = ["prettier"];
          html = ["prettier"];
          javascript = ["prettier"];
          javascriptreact = ["prettier"];
          json = ["prettier"];
          jsonc = ["prettier"];
          markdown = ["prettier"];
          nix = ["alejandra"];
          rust = ["rustfmt"];
          typescript = ["prettier"];
          typescriptreact = ["prettier"];
          vue = ["prettier"];
          yaml = ["prettier"];
        };
        formatters.prettier.prepend_args = ["--single-quote"];
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
    lsp = {
      enable = true;
      keymaps = {
        lspBuf = {
          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
          "gD" = "declaration";
          "gd" = "definition";
          "gi" = "implementation";
          "gr" = "references";
          "K" = "hover";
        };
      };
      servers = {
        cssls.enable = true;
        emmet_ls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        nixd.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          settings = {
            imports = {
              granularity.group = "module";
              merge.glob = false;
            };
            inlayHints = {
              chainingHints.enable = false;
              closingBraceHints.enable = false;
            };
          };
        };
        ts_ls.enable = true;
        vue_ls.enable = true;
      };
    };
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
