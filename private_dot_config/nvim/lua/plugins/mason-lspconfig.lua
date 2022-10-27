local M = {}

function M.setup()
    local lsps = {
        "ansiblels",
        "bashls",
        "cssls",
        "dockerls",
        "golangci_lint_ls",
        "gopls",
        "html",
        "jsonls",
        "sumneko_lua",
        "marksman",
        "rust_analyzer",
        "sqls",
        "taplo",
        "tailwindcss",
        "tsserver",
        "volar",
        "yamlls",
    }

    require("mason-lspconfig").setup({
        ensure_installed = lsps,
    })

    local lspconfig = require("lspconfig")

    local opts = {
        on_attach = require("plugins/cmp-nvim-lsp").on_attach,
        capabilities = require("plugins/cmp-nvim-lsp").capabilities,
    }

    for _, s in pairs(lsps) do
        local o = opts
        if s == "sumneko_lua" then
            o.settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        end
        lspconfig[s].setup(opts)
    end
end

return M

