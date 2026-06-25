require("blink.cmp").setup({
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    preset = 'super-tab',

    ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
  },

  signature = {
    enabled = true,
    window = { border = 'rounded' },
  },

  appearance = {
    -- 'mono'   -> 'Nerd Font Mono'
    -- 'normal' -> 'Nerd Font'
    nerd_font_variant = 'mono'
  },

  completion = {
    list = {
      -- Don't pre-select the first item; auto-insert when you start navigating
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },

    -- Auto-add brackets after completing a function name
    accept = { auto_brackets = { enabled = true }, },

    -- Rounded borders on the completion menu
    menu = {
      border = 'rounded',
      draw = {
        components = {
          label = {
            text = require('colorful-menu').blink_components_text,
            highlight = require('colorful-menu').blink_components_highlight,
          },
        },
      },
    },

    -- Show documentation automatically with a short delay
    documentation = {
      auto_show = false,
      window = { border = 'rounded', },
    },
  },

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = { implementation = "prefer_rust_with_warning" },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },
})
