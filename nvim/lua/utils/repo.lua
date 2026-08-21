-- A set of helper to use as plugin source.
local M = {}

function M.gh(repo) return 'https://github.com/' .. repo end
function M.cb(repo) return 'https://codeberg.org/' .. repo end

return M
