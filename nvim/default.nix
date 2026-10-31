{...}: {
  globals.mapleader = " ";

  opts = {
    clipboard = "unnamedplus";
    cursorline = true;
    expandtab = true;
    guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr:hor20,o:hor50";
    ignorecase = true;
    number = true;
    relativenumber = true;
    scrolloff = 8;
    shiftwidth = 2;
    showmode = false;
    signcolumn = "yes";
    smartcase = true;
    smartindent = true;
    splitbelow = true;
    splitright = true;
    tabstop = 2;
    termguicolors = true;
    undofile = true;
  };

  colorschemes.tokyonight = {
    enable = true;
    settings.style = "night";
  };

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

  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options = {
        desc = "Clear search highlight";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = {
        desc = "Previous buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = {
        desc = "Next buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<CR>";
      options = {
        desc = "Close buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>%bdelete|enew<CR>";
      options = {
        desc = "Close all buffers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<cmd>Yazi<CR>";
      options = {
        desc = "Browse from current file";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cw";
      action = "<cmd>Yazi cwd<CR>";
      options = {
        desc = "Browse project directory";
        silent = true;
      };
    }
  ];
}
