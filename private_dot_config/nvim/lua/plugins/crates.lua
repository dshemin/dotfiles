local M = {}

function M.setup()
    require("crates").setup({
        null_ls = {
            enabled = true,
        },
    })
end

return M

