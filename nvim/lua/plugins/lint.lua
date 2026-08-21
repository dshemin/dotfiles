local cb = require('utils.repo').cb

local M = {}

function M.setup()
  vim.pack.add {
    -- An asynchronous linter plugin for Neovim complementary to the built-in
    -- Language Server Protocol support.
    {
      src = cb 'mfussenegger/nvim-lint',
      version = 'f6230a5c06ba59e6059c14637f1dbe29a7978b9b',
    },
  }

  local lint = require 'lint'

  local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = lint_augroup,
    callback = function()
      -- Only run the linter in buffers that you can modify in order to
      -- avoid superfluous noise, notably within the handy LSP pop-ups that
      -- describe the hovered symbol using Markdown.
      if vim.bo.modifiable then lint.try_lint() end
    end,
  })
end

return M
