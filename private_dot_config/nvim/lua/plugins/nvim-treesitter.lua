local M = {}

function M.setup()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "comment", -- For TODO, FIXME and etc.
            "css",
            "gitignore",
            "go",
            "gomod",
            "gowork",
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
            "vue",
            "yaml",
        },
        highlight = {
            enable = true,
        },
        autopairs = {
            enable = true,
        },
        indent = { enable = true, disable = { "python", "css" } },
    })
end

return M

