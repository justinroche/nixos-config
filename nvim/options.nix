{...}: {
  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "fugitive",
      callback = function(event)
        vim.keymap.set("n", "q", "<cmd>diffoff! | close<CR>", {
          buffer = event.buf,
          desc = "Close Git diff view",
          silent = true,
        })
      end,
    })
  '';

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
}
