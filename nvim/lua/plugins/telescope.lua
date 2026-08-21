local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- Gaze deeply into unknown regions using the power of the moon.
    {
      src = gh 'nvim-telescope/telescope.nvim',
      version = '40aedd8a68c78a656a10a8d62d80c54af59420fb',
    },
    -- Select UI.
    {
      src = gh 'nvim-telescope/telescope-ui-select.nvim',
      version = '6e51d7da30bd139a6950adf2a47fda6df9fa06d2',
    },
    -- FZF sorter for telescope written in c.
    {
      src = gh 'nvim-telescope/telescope-fzf-native.nvim',
      version = 'b25b749b9db64d375d782094e2b9dce53ad53a40',
    },
  }

  local telescope = require 'telescope'

  telescope.setup {
    extensions = {
      ['ui-select'] = { require('telescope.themes').get_dropdown() },
    },
  }

  local exts = {
    'fzf',
    'ui-select',
  }

  for _, ext in ipairs(exts) do
    pcall(telescope.load_extension, ext)
  end

  local builtin = require 'telescope.builtin'
  local kset = vim.keymap.set
  kset('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  kset('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  kset('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
  kset('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  kset(
    { 'n', 'v' },
    '<leader>sw',
    builtin.grep_string,
    { desc = '[S]earch current [W]ord' }
  )
  kset('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  kset('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  kset('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  kset(
    'n',
    '<leader>s.',
    builtin.oldfiles,
    { desc = '[S]earch Recent Files ("." for repeat)' }
  )
  kset('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
  kset(
    'n',
    '<leader><leader>',
    builtin.buffers,
    { desc = '[ ] Find existing buffers' }
  )

  -- Register LSP commands.
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
    callback = function(event)
      local buf = event.buf

      -- Find references for the word under your cursor.
      kset(
        'n',
        'grr',
        builtin.lsp_references,
        { buffer = buf, desc = '[G]oto [R]eferences' }
      )

      -- Jump to the implementation of the word under your cursor.
      -- Useful when your language has ways of declaring types without an actual implementation.
      kset(
        'n',
        'gri',
        builtin.lsp_implementations,
        { buffer = buf, desc = '[G]oto [I]mplementation' }
      )

      -- Jump to the definition of the word under your cursor.
      -- This is where a variable was first declared, or where a function is defined, etc.
      -- To jump back, press <C-t>.
      kset(
        'n',
        'grd',
        builtin.lsp_definitions,
        { buffer = buf, desc = '[G]oto [D]efinition' }
      )

      -- Fuzzy find all the symbols in your current document.
      -- Symbols are things like variables, functions, types, etc.
      kset(
        'n',
        'gO',
        builtin.lsp_document_symbols,
        { buffer = buf, desc = 'Open Document Symbols' }
      )

      -- Fuzzy find all the symbols in your current workspace.
      -- Similar to document symbols, except searches over your entire project.
      kset(
        'n',
        'gW',
        builtin.lsp_dynamic_workspace_symbols,
        { buffer = buf, desc = 'Open Workspace Symbols' }
      )

      -- Jump to the type of the word under your cursor.
      -- Useful when you're not sure what type a variable is and you want to see
      -- the definition of its *type*, not where it was *defined*.
      kset(
        'n',
        'grt',
        builtin.lsp_type_definitions,
        { buffer = buf, desc = '[G]oto [T]ype Definition' }
      )
    end,
  })

  -- Override default behavior and theme when searching
  kset('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  -- It's also possible to pass additional configuration options.
  --  See `:help telescope.builtin.live_grep()` for information about particular keys
  kset(
    'n',
    '<leader>s/',
    function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end,
    { desc = '[S]earch [/] in Open Files' }
  )

  -- Shortcut for searching your Neovim configuration files
  kset(
    'n',
    '<leader>sn',
    function() builtin.find_files { cwd = vim.fn.stdpath 'config', follow = true } end,
    { desc = '[S]earch [N]eovim files' }
  )
end

return M
