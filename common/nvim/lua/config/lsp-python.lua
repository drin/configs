-- ty for type checking
vim.lsp.config('ty', {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', '.git', },
  settings = {
    ty = {
    }
  },
})
vim.lsp.enable('ty')

-- ruff for linting/formatting
vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', '.git', },
  settings = {
    configuration = {
      ruff = { targetVersion = 'py312' },
      line_length = 90,
      lint = {
        enable = true,
      },
      format = { ["quote-style"] = "single" },
    }
  },
})
vim.lsp.enable('ruff')
