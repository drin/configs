require("colorful-menu").setup({
  ls = {
      lua_ls = {
          -- Maybe you want to dim arguments a bit.
          arguments_hl = "@comment",
      },

      gopls = {
          align_type_to_right = false,

          -- When true, label for field and variable will format like "foo: Foo"
          -- instead of go's original syntax "foo Foo". If align_type_to_right is
          -- true, this option has no effect.
          add_colon_before_type = false,

          -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
          preserve_type_when_truncate = true,
      },

      ["rust-analyzer"] = {
          -- Such as (as Iterator), (use std::io).
          extra_info_hl = "@comment",
          -- Similar to the same setting of gopls.
          align_type_to_right = false,
          -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
          preserve_type_when_truncate = true,
      },

      -- The same applies to pyright/pylance
      basedpyright = {
          -- It is usually import path such as "os"
          extra_info_hl = "@comment",
      },

      -- If true, try to highlight "not supported" languages.
      fallback = true,

      -- this will be applied to label description for unsupport languages
      fallback_extra_info_hl = "@comment",
  },

  -- If the built-in logic fails to find a suitable highlight group for a label,
  -- this highlight is applied to the label.
  fallback_highlight = "@variable",

  -- If provided, truncate displayed text to this width (in display cells).
  -- Highlights beyond the truncation point are ignored.
  -- A float between 0 and 1 is percentage of the width of the window:
  -- math.floor(max_width * vim.api.nvim_win_get_width(0))
  -- Default 60.
  max_width = 60,
})
