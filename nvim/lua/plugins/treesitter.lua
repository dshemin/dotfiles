local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- Nvim Treesitter configurations and abstraction layer.
    {
      src = gh 'nvim-treesitter/nvim-treesitter',
      version = '1a4f47b03dfe92d28de7d5654c67327ef008c9e6',
    },
  }

  local parsers = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'dockerfile',
    'diff',
    'editorconfig',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'go',
    'gomod',
    'gosum',
    'gotmpl',
    'gowork',
    'hcl',
    'html',
    'ini',
    'jinja',
    'jinja_inline',
    'json',
    'json5',
    'jsonnet',
    'lua',
    'luadoc',
    'make',
    'markdown',
    'markdown_inline',
    'proto',
    'python',
    'rust',
    'sql',
    'svelte',
    'terraform',
    'toml',
    'tsx',
    'typescript',
    'typespec',
    'xml',
    'yaml',
  }

  local nts = require 'nvim-treesitter'

  nts.install(parsers)

  ---@param buf integer
  ---@param language string
  local function treesitter_try_attach(buf, language)
    -- Check if a parser exists and load it
    if not vim.treesitter.language.add(language) then return end
    -- Enable syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)

    -- Enable treesitter based folds
    -- For more info on folds see `:help folds`
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'

    -- Check if treesitter indentation is available for this language, and if so enable it
    -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
    local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

    -- Enable treesitter based indentation
    if has_indent_query then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end

  local available_parsers = nts.get_available()
  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local buf, filetype = args.buf, args.match

      local language = vim.treesitter.language.get_lang(filetype)
      if not language then return end

      local installed_parsers = nts.get_installed 'parsers'

      if vim.tbl_contains(installed_parsers, language) then
        -- Enable the parser if it is already installed
        treesitter_try_attach(buf, language)
      elseif vim.tbl_contains(available_parsers, language) then
        -- If a parser is available in `nvim-treesitter`, auto-install it and enable it after the installation is done
        nts
          .install(language)
          :await(function() treesitter_try_attach(buf, language) end)
      else
        -- Try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
        treesitter_try_attach(buf, language)
      end
    end,
  })
end

return M
