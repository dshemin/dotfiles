local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- autopairs for neovim written in lua
    {
      src = gh 'windwp/nvim-autopairs',
      version = '3172f40c16563db871a58f20d205c710ad782311',
    },
  }

  require('nvim-autopairs').setup {}
end

return M
