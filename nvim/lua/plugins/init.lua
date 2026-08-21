local r = function(name) return require('plugins.' .. name) end
local s = function(name) r(name).setup() end

local mason = r 'mason'

-- Load utils fist because some packages depends on them.
s 'utils'

-- Load and setup LSP, debugges, lintes, formattes and other programmes staff.
s 'treesitter'
s 'autocomplete'
s 'indentomatic'
s 'autopairs'
s 'gitsigns'

mason.pre_setup()

s 'lsp'
s 'fmt'
s 'lint'

mason.setup()

-- UI/UX
s 'lualine'
s 'telescope'
s 'whichkey'
s 'theme'
