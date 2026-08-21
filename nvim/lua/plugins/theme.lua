local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- A dark and light Neovim theme written in Lua ported from the Visual Studio
    -- Code TokyoNight theme. Includes extra themes for Kitty, Alacritty, iTerm and
    -- Fish.
    {
      src = gh 'folke/tokyonight.nvim',
      version = 'cdc07ac78467a233fd62c493de29a17e0cf2b2b6',
    },
  }

  require('tokyonight').setup {
    ---@type table<string, boolean|{enabled:boolean}>
    plugins = {
      ['gitsigns'] = true,
      ['telescope'] = true,
      ['treesitter'] = true,
      ['which-key'] = true,
    },
  }

  vim.cmd.colorscheme 'tokyonight-night'
end

return M
