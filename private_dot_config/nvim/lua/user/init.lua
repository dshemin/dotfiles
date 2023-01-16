local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

cmd("BufEnter", {
    desc = "All files matched patter .env.* should be interpret as an dotenv files",
    group = augroup("dotenv", { clear = true }),
    pattern = "*.env.*",
    callback = function()
        vim.bo.filetype = "sh"
    end
})

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
            -- Disable different colors for parenthesis.
            ["p00f/nvim-ts-rainbow"] = { disable = true },

            -- Add prefered color schema.
            ["doums/darcula"] = { commit = "faf8dbab27bee0f27e4f1c3ca7e9695af9b1242b" },

            -- PlantUML syntax highlight and snippets.
            ["aklt/plantuml-syntax"] = { commit = "845abb56dcd3f12afa6eb47684ef5ba3055802b8" },

            -- PlantUML previewer.
            ["weirongxu/plantuml-previewer.vim"] = { commit = "74483d5d01042db5de6f89aaba64376d87effaff" },

            -- Plugin which allows to open URLs from NeoVim in the browser.
            ["tyru/open-browser.vim"] = { commit = "7d4c1d8198e889d513a030b5a83faa07606bac27" },

            -- Enable auto Save.
            ["Pocco81/auto-save.nvim"] = {
                commit = "979b6c82f60cfa80f4cf437d77446d0ded0addf0",
                config = function()
                    require("auto-save").setup()
                end,
            }
        },
        ["cmp"] = function(config)
            local cmp = require("cmp")
            config.mapping["<CR>"] = cmp.mapping.confirm({ select = true })
            return config
        end,
        ["mason-lspconfig"] = {
            ensure_installed = {
                "ansiblels",
                "bashls",
                "cssls",
                "dockerls",
                "dotls",
                "eslint",
                "gopls",
                "html",
                "jsonls",
                "marksman",
                "pyright",
                "rust_analyzer",
                "sqls",
                "sumneko_lua",
                "tailwindcss",
                "taplo",
                "terraformls",
                "tsserver",
                "vuels",
                "yamlls",
            },
        },
        ["mason-nvim-dap"] = {
            ensure_installed = {
                "codelldb",
                "delve",
            },
        },
        ["neo-tree"] = function(config)
            config.filesystem = {
                filtered_items = {
                    hide_dotfiles = false
                }
            }
            return config
        end
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

    -- Configure LSP.
    lsp = {
        formatting = {
            disabled = {
                "sqls",
            }
        }
    },

    treesitter = {
        ensure_installed = {
            "bash",
            "c",
            "comment",
            "css",
            "gitignore",
            "go",
            "gomod",
            "gowork",
            "help",
            "html",
            "javascript",
            "json",
            "ledger",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "php",
            "phpdoc",
            "proto",
            "regex",
            "rust",
            "sql",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vue",
            "yaml",
        },
    },
}

return config
