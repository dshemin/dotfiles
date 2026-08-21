local gh = require('utils.repo').gh

local lsps = require 'config.lsp'

local M = {}

function M.pre_setup()
  vim.pack.add {
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    {
      src = gh 'mason-org/mason.nvim',
      version = 'v2.3.1',
    },
    -- Install and upgrade third party tools automatically
    {
      src = gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
      version = '443f1ef8b5e6bf47045cb2217b6f748a223cf7dc',
    },
  }

  require('mason').setup {}
end

function M.setup()
  require('mason-tool-installer').setup {
    ensure_installed = vim.tbl_keys(lsps or {}),
    auto_update = true,
    integrations = {
      ['mason-lspconfig'] = true,
      ['mason-null-ls'] = false,
      ['mason-nvim-dap'] = true,
    },
  }
end

return M
