vim.lsp.config('rust-analyzer', {
  settings = {
    ['rust-analyzer'] = {
      cargo = { features = 'all', },
      check = { command = 'clippy', },
      inlayHints = {
        closingBraceHints = { enable = true, },
        typeHints = { enable = false, },
        parameterHints = { enable = false, },
      },
    }
  }
})
vim.lsp.enable('rust-analyzer')
