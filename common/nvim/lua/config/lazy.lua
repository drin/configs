-- Bootstraps lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- prepare to clone the repo
  local lazy_repo_uri = "https://github.com/folke/lazy.nvim.git"
  local clone_status  = vim.fn.system({
    "git", "clone",
           "--filter=blob:none",
           "--branch=stable"   ,
           lazy_repo_uri       ,
           lazypath
  })

  -- if error, print msg and exit
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo(
      {
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { clone_status, "WarningMsg" },
        { "\nPress any key to exit..." },
      },
      true,
      {}
    )

    vim.fn.getchar()
    os.exit(1)
  end

end
vim.opt.rtp:prepend(lazypath)


-- Setup `mapleader` and `maplocalleader` before loading lazy.nvim
vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"




-- Setup the lazy.nvim plugin itself (not to be confused with LazyVim)
require("lazy").setup({
  -- Simple spec to import my plugins
  spec    = {
    { import = "plugins" },
  },

  install = { colorscheme = { "seoul256", "catppuccin" }, },

  -- checks plugin updates automatically, periodically
  checker = {
    enabled = true,
    notify  = true,
  },
})
