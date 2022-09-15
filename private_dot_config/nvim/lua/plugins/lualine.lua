-- Lualine configuration.

local M = {}

function M.setup()
    local colors = {
        bg = "323232",
        fg_main = "#606366",
        fg_insert = "#6A8759",
        fg_visual = "#CC7832",

        fg_second = "#4d4d4c",
        bg_second = "#b4b4b4",

        fg_third = "#555555",
        bg_third = "#222222",
    }

    local theme = {
        inactive = {
            a = { fg = colors.fg_main, bg = colors.bg, gui = "bold" },
            b = { fg = colors.fg_second, bg = colors.bg_second },
        },
        normal = {
            a = { fg = colors.fg_main, bg = colors.bg, gui = "bold" },
            b = { fg = colors.fg_second, bg = colors.bg_second },
            c = { fg = colors.fg_third, bg = colors.bg_third },
        },
        visual = {
            a = { fg = colors.fg_visual, bg = colors.bg, gui = "bold" },
            b = { fg = colors.fg_second, bg = colors.bg_second },
        },
        replace = {
            a = { fg = colors.fg_main, bg = colors.bg, gui = "bold" },
            b = { fg = colors.fg_second, bg = colors.bg_second },
        },
        insert = {
            a = { fg = colors.fg_insert, bg = colors.bg, gui = "bold" },
            b = { fg = colors.fg_second, bg = colors.bg_second },
        },
    }

    require("lualine").setup({
        options = {
            theme = theme,
            disabled_filetypes = { "NvimTree" },
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch", "diff", "diagnostics"},
            lualine_c = {},
            lualine_x = {"encoding", "filetype"},
            lualine_y = {},
            lualine_z = {"location"}
        },
        extensions = {"nvim-tree"},

    })
end

return M

