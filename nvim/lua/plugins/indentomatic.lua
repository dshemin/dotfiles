local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- Dumb automatic fast indentation detection for Neovim written in Lua.
    {
      src = gh 'Darazaki/indent-o-matic',
      version = '81fa0e03bd2615a23b23312512371a2fc47fc0a4',
    },
  }

  require('indent-o-matic').setup {
    max_lines = -1,
    standard_widths = { 2, 4 },
    skip_multiline = true,
  }
end

return M
