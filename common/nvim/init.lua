-- Include lua initialization of a plugin via `lua/config/<pkg>.lua`
require('config.lazy')
require('config.seoul256')
require('config.lualine')
-- require('config.coc')
require('config.blink')

-- Color schemes
require('config.catppuccin')
require('config.nord')
require('config.gruvbox')
require('config.colorscheme')

-- My custom config (I think lazy.nvim does not autoload them?)
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- LSP configurations
require('config.lsp-python')
require('config.lsp-rust')
