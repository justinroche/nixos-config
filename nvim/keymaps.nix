{...}: {
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
      key = "<leader>e";
      action = "<cmd>lua vim.diagnostic.open_float({ scope = 'buffer' })<CR>";
      options = {
        desc = "Open buffer diagnostics";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[d";
      action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      options = {
        desc = "Previous diagnostic";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "]d";
      action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      options = {
        desc = "Next diagnostic";
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
      action = "<cmd>bdelete!<CR>";
      options = {
        desc = "Close buffer without saving";
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
