local M = {}

function M.setup()
    require("project_nvim").setup({
        detection_methods = { "pattern" },

        patterns = { ".git", "Makefile", "package.json", "composer.json", "Cargo.toml" },
    })
end

return M

