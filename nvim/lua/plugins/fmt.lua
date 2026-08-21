local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- Lightweight yet powerful formatter plugin for Neovim
    {
      src = gh 'stevearc/conform.nvim',
      version = '016802de402556da54c36bd7359b441266b01cdd',
    },
  }

  require('conform').setup {
    notify_on_error = false,
    formatters_by_ft = {
      rust = { 'rustfmt' },
      lua = { 'stylua' },
      go = { 'goimports', 'gofmt' },
    },
    default_format_opts = {
      lsp_format = 'fallback',
    },
    format_on_save = {
      lsp_format = 'fallback',
      timeout_ms = 500,
    },
    format_after_save = {
      lsp_format = 'fallback',
    },
  }

  vim.keymap.set(
    { 'n', 'v' },
    '<leader>f',
    function() require('conform').format { async = true } end,
    { desc = '[F]ormat buffer' }
  )
end

return M
