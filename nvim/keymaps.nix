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
