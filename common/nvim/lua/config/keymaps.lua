-- Key mappings from vimrc

-- Remove trailing spaces from lines with F6
vim.keymap.set('n', '<F6>', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>', { silent = true })

-- VCS Blame (works with all VCS)
vim.keymap.set('n', '<C-b><C-b>', ':VCSBlame<CR>')

-- Toggle line numbers
vim.keymap.set('n', '<C-N><C-N>', ':set invnumber<CR>')

-- Toggle wrap
vim.keymap.set('n', '<C-w><C-w>', ':set invwrap<CR>')

-- Toggle paste mode
vim.keymap.set('n', '<C-p><C-p>', ':set invpaste<CR>')

-- Code folding with space key
vim.keymap.set('v', '<space>', 'zf<CR>')
vim.keymap.set('n', '<space>', 'zd<CR>')

-- Tab navigation
vim.keymap.set('n', 'tn', ':tabnew<CR>')
vim.keymap.set('n', 'tq', ':tabclose<CR>')
vim.keymap.set('n', 'th', ':tabp<CR>')
vim.keymap.set('n', 'tl', ':tabn<CR>')

-- Window navigation
vim.keymap.set('n', 'ek', '<c-w><Up>')
vim.keymap.set('n', 'ej', '<c-w><Down>')
vim.keymap.set('n', 'eh', '<c-w><Left>')
vim.keymap.set('n', 'el', '<c-w><Right>')
vim.keymap.set('n', 'er', '<c-w>r')
