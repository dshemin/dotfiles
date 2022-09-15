local M = {}

function M.setup()
    require("mason").setup()

    local pkgs = {
        "ansible-language-server",
        "bash-language-server",
        "css-lsp",
        "dockerfile-language-server",
        "golangci-lint-langserver",
        "gotests",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "rust-analyzer",
        "sqls",
        "tailwindcss-language-server",
        "terraform-ls",
        "typescript-language-server",
        "vue-language-server",
        "yaml-language-server",
        "gopls",
    }

    local registry = require("mason-registry")
    local cmd = vim.cmd

    for i,v in ipairs(pkgs) do
        if not registry.is_installed(v) then
            cmd("MasonInstall "..v)
        end
    end
	-- patterns used to detect root dir, when **"pattern"** is in detection_methods
end

return M

