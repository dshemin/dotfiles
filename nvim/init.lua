-- Main configuration file.

if vim.fn.has 'nvim-0.12' ~= 1 then
  print 'Only neovim 0.12 is supported'
  return
end

-- Load configuration.
-- Configure neovim, not a plugins.
require 'config'

-- Load plugins.
-- All plugins and related config will be loaded on demand.
require 'plugins'
