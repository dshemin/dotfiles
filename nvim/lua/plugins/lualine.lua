local gh = require('utils.repo').gh

local M = {}

local function get_lsp_client()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  if next(clients) == nil then return 'No LSP' end
  local client_names = {}
  for _, client in ipairs(clients) do
    table.insert(client_names, client.name)
  end
  return table.concat(client_names, ', ')
end

function M.setup()
  vim.pack.add {
    -- A blazing fast and easy to configure Neovim statusline written in Lua.
    {
      src = gh 'nvim-lualine/lualine.nvim',
      version = '221ce6b2d999187044529f49da6554a92f740a96',
    },
  }

  require('lualine').setup {
    options = {
      theme = 'tokyonight',
    },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(str) return str:sub(1, 1) end,
        },
      },
      lualine_b = { 'branch', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          path = 1,
          symbols = {
            modified = '[+]',
            readonly = '[-]',
            unnamed = '[No Name]',
            newfile = '[New]',
          },
        },
        get_lsp_client,
      },
      lualine_x = { 'encoding', 'filetype' },
      lualine_y = {},
      lualine_z = { 'location' },
    },
  }
end

return M
