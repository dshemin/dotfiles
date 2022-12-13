local config = {

    -- Configure AstroNvim updates
    updater = {
        remote = "origin",
        channel = "stable",
        version = "latest",
        skip_prompts = false,
        show_changelog = true,
        auto_reload = true,
        auto_quit = true,
    },

    colorscheme = "darcula",
    highlights = {
        darcula = {
            Normal = { bg = "#222222" },
        },
    },

    options = {
        opt = {
            relativenumber = true,
            number = true,
            spell = false,
            signcolumn = "auto",
            wrap = false,
            listchars = {
                tab = "━━",
                multispace = "･",
                trail = "･",
            },
            list = true,
            cursorline = true,
        },
        g = {
            mapleader = " ",
            autoformat_enabled = true,
            cmp_enabled = true,
            autopairs_enabled = true,
            diagnostics_enabled = true,
            status_diagnostics_enabled = true,
            icons_enabled = true,
            ui_notifications_enabled = true,
        },
    },

    diagnostics = {
        virtual_text = true,
        underline = true,
    },

    mappings = {
        n = {
            ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
            ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
            ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
            ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
            ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
            ["<C-e>"] = { "$", desc = "Move to the end of the line" },
            ["<C-a>"] = { "^", desc = "Move to the beginning of the line" },
            ["<Tab>"] = { ">>_", desc = "Indent line to the right" },
            ["<S-Tab>"] = { "<<_", desc = "Indent line to the left" },
        },
        i = {
            ["<C-e>"] = { "<ESC>A", desc = "Move to the end of the line" },
            ["<C-a>"] = { "<ESC>I", desc = "Move to the beginning of the line" },
        },
        v = {
            ["<Tab>"] = { ">gv", desc = "Indent line to the right" },
            ["<S-Tab>"] = { "<gv", desc = "Indent line to the left" },
        },
    },

    -- Configure plugins
    plugins = {
        init = {
            ["doums/darcula"] = { commit = "faf8dbab27bee0f27e4f1c3ca7e9695af9b1242b" }
        },
        ["cmp"] = function(config)
            local cmp = require("cmp")
            config.mapping["<CR>"] = cmp.mapping.confirm({ select = true })
            return config
        end,
    },

    -- LuaSnip Options
    luasnip = {
        -- Extend filetypes
        filetype_extend = {
            -- javascript = { "javascriptreact" },
        },
        -- Configure luasnip loaders (vscode, lua, and/or snipmate)
        vscode = {
            -- Add paths for including more VS Code style snippets in luasnip
            paths = {},
        },
    },

    -- CMP Source Priorities
    -- modify here the priorities of default cmp sources
    -- higher value == higher priority
    -- The value can also be set to a boolean for disabling default sources:
    -- false == disabled
    -- true == 1000
    cmp = {
        source_priority = {
            nvim_lsp = 1000,
            luasnip = 750,
            buffer = 500,
            path = 250,
        },
    },

    -- Modify which-key registration (Use this with mappings table in the above.)
    ["which-key"] = {
        -- Add bindings which show up as group name
        register = {
            -- first key is the mode, n == normal mode
            n = {
                -- second key is the prefix, <leader> prefixes
                ["<leader>"] = {
                    -- third key is the key to bring up next level and its displayed
                    -- group name in which-key top level menu
                    ["b"] = { name = "Buffer" },
                },
            },
        },
    },
}

return config
