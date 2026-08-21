local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions
    -- I don't want to write twice.
    {
      src = gh 'nvim-lua/plenary.nvim',
      version = '74b06c6c75e4eeb3108ec01852001636d85a932b',
    },
  }
end

return M
