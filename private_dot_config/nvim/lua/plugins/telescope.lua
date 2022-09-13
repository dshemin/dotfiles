local M = {}

function M.setup()
    local map = vim.keymap.set

    require("telescope").setup()

    map("n", "<LEADER>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")
    map("n", "<LEADER>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
    map("n", "<LEADER>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
    map("n", "<LEADER>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>")
end

return M

