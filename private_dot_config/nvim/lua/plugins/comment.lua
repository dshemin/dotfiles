local M = {}

function M.setup()
    local map = vim.keymap.set

    require("Comment").setup()

    map("n", "<LEADER>/", "<CMD>lua require('Comment.api').toggle.linewise.current()<CR>")
    map("x", "<LEADER>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
end

return M

