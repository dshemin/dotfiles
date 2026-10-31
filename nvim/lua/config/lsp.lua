-- List of all used LSP with configuration
-- All LSP grouped by categories because sometime their name didn't descriptive.

local lsps = {
  ---------------
  -- Programming
  ---------------
  -- Bash
  bashls = {},

  -- C/C++
  clangd = {},
  cmake = {},

  -- Frontend
  css_variables = {},
  cssls = {},
  emmet_ls = {},
  html = {},
  svelte = {},
  tailwindcss = {},
  ts_ls = {},

  -- Go
  golangci_lint_ls = {},
  gopls = {},

  -- Lua
  lua_ls = {
    on_init = function(client)
      client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath 'config'
          and (
            vim.uv.fs_stat(path .. '/.luarc.json')
            or vim.uv.fs_stat(path .. '/.luarc.jsonc')
          )
        then
          return
        end
      end

      local current_settings = client.config.settings --[[@as lspconfig.settings.lua_ls]]
      client.config.settings.Lua =
        vim.tbl_deep_extend('force', current_settings.Lua, {
          runtime = {
            version = 'LuaJIT',
            path = { 'lua/?.lua', 'lua/?/init.lua' },
          },
          workspace = {
            checkThirdParty = false,
            -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
            --  See https://github.com/neovim/nvim-lspconfig/issues/3189
            library = vim.api.nvim_get_runtime_file('', true),
          },
        })
    end,
    ---@type lspconfig.settings.lua_ls
    settings = {
      Lua = {
        format = { enable = false }, -- Disable formatting (formatting is done by stylua)
      },
    },
  },
  stylua = {},

  -- Python
  basedpyright = {},
  ruff = {},
  jinja_lsp = {},
  ['pytest-language-server'] = {},

  -- Rust
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allTargets = true,
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
        assist = {
          preferSelf = true,
        },
        check = {
          command = 'clippy',
        },
        joinLines = {
          removeTrailingComma = false,
        },
        hover = {
          memoryLayout = {
            enable = true,
            alignment = 'both',
            padding = 'both',
          },
        },
      },
    },
  },

  ---------
  -- DevOps
  ---------
  ansiblels = {},
  gh_actions_ls = {},
  docker_compose_language_service = {},
  dockerls = {},
  helm_ls = {},
  tofu_ls = {},

  --------
  -- Files
  --------
  jsonls = {},
  yamlls = {},
}

return lsps
