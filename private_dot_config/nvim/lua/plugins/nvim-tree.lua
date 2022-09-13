local M = {}

function M.setup()
    local map = vim.keymap.set

    require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true
        },
    })

    map("n", "<LEADER>e", "<CMD>NvimTreeToggle<CR>")
end

return M

