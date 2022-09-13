local M = {}

function M.setup()
    local map = vim.keymap.set

    require("bufferline").setup({
        options = {
            numbers = "ordinal",
            separator_style = "slant",
        },
    })

    for i = 1,9 do
        local cmd = string.format("<ESC><CMD>lua require('bufferline').go_to_buffer(%d)<CR>", i)
        map({"n", "i", "v"}, string.format("<LEADER>%d", i), cmd)
    end
end

return M

