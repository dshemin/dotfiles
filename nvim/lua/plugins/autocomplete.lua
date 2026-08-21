-- Setup autocomplete and snippet engine.
local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- Snippet Engine for Neovim written in Lua.
    {
      src = gh 'L3MON4D3/LuaSnip',
      version = 'v2.5.0',
    },
    -- Performant, batteries-included completion plugin for Neovim.
    {
      src = gh 'saghen/blink.cmp',
      version = 'v1.10.2',
    },
  }

  require('luasnip').setup {}
  require('luasnip.loaders.from_snipmate').lazy_load()
  require('blink.cmp').setup {
    keymap = {
      preset = 'default',
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },

    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
      },
    },

    snippets = {
      preset = 'luasnip',
    },

    fuzzy = {
      implementation = 'lua',
    },

    signature = {
      enabled = true,
    },
  }
end

return M
