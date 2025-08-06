require("catppuccin").setup({
  flavour    = "frappe", -- auto, latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "frappe",
    dark  = "mocha",
  },

  transparent_background = true, -- disables setting the background color.
  float = {
      transparent = false, -- enable transparent floating windows
      solid       = false, -- use solid styling for floating windows, see |winborder|
  },

  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors        = false, -- sets terminal colors (e.g. `g:terminal_color_0`)

  dim_inactive = {
      enabled    = true, -- dims the background color of inactive window
      shade      = "dark",
      percentage = 0.05, -- percentage of the shade to apply to the inactive window
  },

  no_italic    = false, -- Force no italic
  no_bold      = false, -- Force no bold
  no_underline = false, -- Force no underline

  -- Handles the styles of general hi groups (see `:h highlight-args`):
  styles = { 
      comments     = { "bold"      }, -- Change the style of comments
      conditionals = { "italic"    },
      loops        = {},
      functions    = {},
      keywords     = { "bold"      },
      strings      = {},
      variables    = { "italic"    },
      numbers      = { "underline" },
      booleans     = { "underline" },
      properties   = {},
      types        = { "bold"      },
      operators    = { "bold"      },
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },

  color_overrides      = {},
  custom_highlights    = {},
  default_integrations = true,
  auto_integrations    = false,

  integrations = {
      cmp        = true,
      gitsigns   = true,
      nvimtree   = true,
      treesitter = true,
      notify     = false,

      mini = {
          enabled           = false,
          indentscope_color = "",
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})
