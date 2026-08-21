local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- WhichKey helps you remember your Neovim keymaps, by showing available
    -- keybindings in a popup as you type.
    {
      src = gh 'folke/which-key.nvim',
      version = '3aab2147e74890957785941f0c1ad87d0a44c15a',
    },
  }

  require('which-key').setup {
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },
  }
end

return M
