-- Some global keymaps configuration.

-- Set leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local set = vim.keymap.set

set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)
