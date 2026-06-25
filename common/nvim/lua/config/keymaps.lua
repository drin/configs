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


-- LSPs
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true, nowait = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)

    vim.keymap.set('n', 'gh', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.goto_next, opts)

    vim.keymap.set('n', 'gA', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gf', vim.lsp.buf.format, opts)
  end,
})


-- -- ------------------------------
-- -- CoC.nvim
--
-- -- >> Autocomplete
--
-- -- trigger with Ctrl-Space
-- if vim.fn.has('nvim') == 1 then
--   vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true })
-- else
--   vim.keymap.set('i', '<C-@>', 'coc#refresh()', { expr = true, silent = true })
-- end
--
-- -- change selection with tab (forward) and shift+tab (reverse)
-- vim.keymap.set(
--   'i', '<Tab>',
--   function()
--     if vim.fn['coc#pum#visible']() == 1 then
--       return vim.fn['coc#pum#next'](1)
--
--     elseif vim.fn['CheckBackspace']() == 1 then
--       return '<Tab>'
--
--     else
--       return vim.fn['coc#refresh']()
--
--     end
--   end,
--   { expr = true, silent = true }
-- )
--
-- -- change selection with shift+tab (reverse)
-- vim.keymap.set(
--   'i', '<S-Tab>',
--   function()
--     if vim.fn['coc#pum#visible']() == 1 then
--       return vim.fn['coc#pum#prev'](1)
--     else
--       return '<C-h>'
--     end
--   end,
--   { expr = true, silent = true }
-- )
--
-- -- choose selection with Enter
-- vim.keymap.set(
--   'i', '<CR>',
--   function()
--     if vim.fn['coc#pum#visible']() == 1 then
--       return vim.fn['coc#pum#confirm']()
--     else
--       return '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
--     end
--   end,
--   { expr = true, silent = true }
-- )
--
--
-- -- >> Diagnostics (compilation issues, etc.)
-- -- navigation (use `[g` and `]g`)
-- vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true, nowait = true })
-- vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true, nowait = true })
--
-- -- code navigation
-- vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true, nowait = true })
-- vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true, nowait = true })
-- vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true, nowait = true })
-- vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true, nowait = true })
--
--
-- -- >> Documentation
--
-- -- show with K
-- vim.keymap.set('n', 'K', vim.fn['ShowDocumentation'], { silent = true })
--
-- -- Scroll float windows/popups with Ctrl-j (down) and Ctrl-k (up)
-- if vim.fn.has('nvim-0.4.0') == 1 or vim.fn.has('patch-8.2.0750') == 1 then
--
--   -- Normal mode
--   vim.keymap.set(
--     'n', '<C-j>',
--     function()
--       return vim.fn['coc#float#has_scroll']() == 1 and vim.fn['coc#float#scroll'](1) or '<C-j>'
--     end,
--     { expr = true, silent = true, nowait = true }
--   )
--
--   vim.keymap.set(
--     'n', '<C-k>',
--     function()
--       return vim.fn['coc#float#has_scroll']() == 1 and vim.fn['coc#float#scroll'](0) or '<C-k>'
--     end,
--     { expr = true, silent = true, nowait = true }
--   )
--
--   -- Insert mode
--   vim.keymap.set(
--     'i', '<C-j>',
--     function()
--       return vim.fn['coc#float#has_scroll']() == 1 and '<c-r>=' .. vim.fn['coc#float#scroll'](1) .. '<cr>' or '<Right>'
--     end,
--     { expr = true, silent = true, nowait = true }
--   )
--
--   vim.keymap.set(
--     'i', '<C-k>',
--     function()
--       return vim.fn['coc#float#has_scroll']() == 1 and '<c-r>=' .. vim.fn['coc#float#scroll'](0) .. '<cr>' or '<Left>'
--     end,
--     { expr = true, silent = true, nowait = true }
--   )
--
--   -- Visual mode
--   vim.keymap.set(
--     'v', '<C-j>',
--     function()
--       return vim.fn['coc#float#has_scroll']() == 1 and vim.fn['coc#float#scroll'](1) or '<C-j>'
--     end,
--     { expr = true, silent = true, nowait = true }
--   )
--
--   vim.keymap.set(
--     'v', '<C-k>',
--     function()
--       return vim.fn['coc#float#has_scroll']() == 1 and vim.fn['coc#float#scroll'](0) or '<C-k>'
--     end,
--     { expr = true, silent = true, nowait = true }
--   )
-- end
