-- Basic Setup
vim.opt.encoding   = "utf-8"
vim.opt.compatible = false
vim.opt.hidden     = true

-- Search behavior
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch  = true

-- UI settings
vim.opt.errorbells = false
vim.opt.number     = true
vim.opt.ruler      = true
vim.opt.showcmd    = true
vim.opt.showmatch  = true
vim.opt.showmode   = true

-- Tab completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list"

-- Modeline
vim.opt.modeline = true

-- Indentation
vim.opt.autoindent  = true
vim.opt.expandtab   = true
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.textwidth   = 99
vim.opt.softtabstop = 2
vim.opt.scrolloff   = 5
vim.opt.wrap        = true

-- Status line
vim.opt.laststatus = 2
vim.opt.statusline = "%<%f %m %h%r%=%b 0x%B  %l,%c%V %P of %L"

-- Swap and view files
vim.opt.viewoptions = "folds"
vim.opt.directory   = vim.fn.expand("$HOME/.vim/swap")
vim.opt.viewdir     = vim.fn.expand("$HOME/.vim/view")

-- Backspace behavior
vim.opt.backspace = "2"

