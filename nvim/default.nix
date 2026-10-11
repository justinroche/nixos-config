{...}: {
  globals.mapleader = " ";

  opts = {
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
  ];
}
