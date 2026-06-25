local function custom_augroup(name)
  return vim.api.nvim_create_augroup("octalene_" .. name, { clear = true })
end

-- NOTE: defined by default by lazy vim
-- Jump to last known cursor position.
vim.api.nvim_create_autocmd(
   { "BufReadPost" }
  ,{
      group = custom_augroup("lastloc")
     ,callback = function(event)
        local exclude = { "gitcommit" }
        local buf     = event.buf

        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
           return
        end

        vim.b[buf].lazyvim_last_loc = true

        local mark   = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)

        if mark[1] > 0 and mark[1] <= lcount then
          pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
      end
   }
)

-- General filetypes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern  = "*.txt",
  group    = custom_augroup("txt_opts"),
  callback = function()
    vim.opt_local.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern  = { "*.md", "*.markdown" },
  group    = custom_augroup("markdown_opts"),
  callback = function()
    vim.opt_local.filetype = "markdown"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern  = "*.less",
  group    = custom_augroup("less_opts"),
  callback = function()
    vim.opt_local.filetype = "less"
  end,
})

-- Programming language filetypes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern  = "*.flake8",
  group    = custom_augroup("flake8_opts"),
  callback = function()
    vim.opt_local.filetype = "dosini"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern  = "*.g",
  group    = custom_augroup("antlr_opts"),
  callback = function()
    vim.opt_local.filetype = "antlr"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern  = "*.go",
  group    = custom_augroup("go_opts"),
  callback = function()
    vim.opt_local.expandtab   = false
    vim.opt_local.shiftwidth  = 2
    vim.opt_local.tabstop     = 2
    vim.opt_local.softtabstop = 0
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern  = { "[Mm]akefile*" },
  group    = custom_augroup("makefile_opts"),
  callback = function()
    vim.opt_local.expandtab  = false
    vim.opt_local.tabstop    = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.cindent    = false
    vim.opt_local.list       = true
    vim.opt_local.listchars  = { tab = ">-", trail = "x" }
  end,
})

