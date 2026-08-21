local gh = require('utils.repo').gh

local M = {}

function M.setup()
  vim.pack.add {
    -- Git integration for buffers.
    {
      src = gh 'lewis6991/gitsigns.nvim',
      version = 'v2.1.0',
    },
  }

  local kset = vim.keymap.set

  local gitsigns = require 'gitsigns'
  gitsigns.setup {
    signs = {
      add = { text = '+' }, ---@diagnostic disable-line: missing-fields
      change = { text = '~' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
    },
    on_attach = function(bufnr)
      -- Navigation
      kset('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange', buf = bufnr })

      kset('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange', buf = bufnr })

      -- Visual mode actions
      kset(
        'v',
        '<leader>hs',
        function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
        { desc = 'git [s]tage hunk', buf = bufnr }
      )
      kset(
        'v',
        '<leader>hr',
        function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
        { desc = 'git [r]eset hunk', buf = bufnr }
      )
      -- Normal mode actions
      kset(
        'n',
        '<leader>hs',
        gitsigns.stage_hunk,
        { desc = 'git [s]tage hunk', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hr',
        gitsigns.reset_hunk,
        { desc = 'git [r]eset hunk', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hS',
        gitsigns.stage_buffer,
        { desc = 'git [S]tage buffer', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hR',
        gitsigns.reset_buffer,
        { desc = 'git [R]eset buffer', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hp',
        gitsigns.preview_hunk,
        { desc = 'git [p]review hunk', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hi',
        gitsigns.preview_hunk_inline,
        { desc = 'git preview hunk [i]nline', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hb',
        function() gitsigns.blame_line { full = true } end,
        { desc = 'git [b]lame line', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hd',
        gitsigns.diffthis,
        { desc = 'git [d]iff against index', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hD',
        function() gitsigns.diffthis '~' end,
        { desc = 'git [D]iff against last commit', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hQ',
        function() gitsigns.setqflist 'all' end,
        { desc = 'git hunk [Q]uickfix list (all files in repo)', buf = bufnr }
      )
      kset(
        'n',
        '<leader>hq',
        gitsigns.setqflist,
        { desc = 'git hunk [q]uickfix list (all changes in this file)', buf = bufnr }
      )
      -- Toggles
      kset(
        'n',
        '<leader>tb',
        gitsigns.toggle_current_line_blame,
        { desc = '[T]oggle git show [b]lame line', buf = bufnr }
      )
      kset(
        'n',
        '<leader>tw',
        gitsigns.toggle_word_diff,
        { desc = '[T]oggle git intra-line [w]ord diff', buf = bufnr }
      )
      -- Text object
      kset(
        { 'o', 'x' },
        'ih',
        gitsigns.select_hunk,
        { desc = 'text object [i]nside [h]unk', buf = bufnr }
      )
    end,
  }
end

return M
