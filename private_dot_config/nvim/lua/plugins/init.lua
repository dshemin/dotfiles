-- Install all required plugins.

local M = {}

local function install_packer()
    local fn = vim.fn
    local cmd = vim.cmd

    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

function config(p)
    require(string.format("plugins/%s", p)).setup()
end

local function packer_startup(bootstraped)
    return function(use)
        use {
            "wbthomason/packer.nvim",
            commit = "6afb67460283f0e990d35d229fd38fdc04063e0a",
        }

        -- Color theme from JetBrains.
        use {
            "doums/darcula",
            commit = "faf8dbab27bee0f27e4f1c3ca7e9695af9b1242b",
        }

        -- Replacement for status line.
        use {
            "nvim-lualine/lualine.nvim",
            commit = "3cf45404d4ab5e3b5da283877f57b676cb78d41d",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function() config("lualine") end,
        }

        -- Comment manipulation.
        use {
            "numToStr/Comment.nvim",
            comment = "30d23aa2e1ba204a74d5dfb99777e9acbe9dd2d6",
            config = function() config("comment") end,
        }

        --  Tree.
        use {
            "kyazdani42/nvim-tree.lua",
            comment = "3e49d9b7484e21f0b24ebdf21b8b7af227ea97a6",
            config = function() config("nvim-tree") end,
        }

        -- Tabline.
        use {
            "akinsho/bufferline.nvim",
            commit = "ffa1d0009f5e52d3d32d08c9a781f18b2b2ef507",
            config = function() config("bufferline") end,
        }

        -- Projects.
        use {
            "ahmedkhalf/project.nvim",
            commit = "090bb11ee7eb76ebb9d0be1c6060eac4f69a240f",
            config = function() config("project") end,
        }

        -- Code completition.
        use {
            "hrsh7th/nvim-cmp",
            commit = "913eb8599816b0b71fe959693080917d8063b26a",
            config = function() config("nvim-cmp") end,
        }
        use {
            "hrsh7th/cmp-buffer",
            commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
        }
        use {
            "hrsh7th/cmp-path",
            commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1",
        }
        use {
            "saadparwaiz1/cmp_luasnip",
            commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
        }
        use {
            "hrsh7th/cmp-nvim-lsp",
            commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
            config = function() config("cmp-nvim-lsp") end,
        }
        use {
            "hrsh7th/cmp-nvim-lua",
            commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
        }
        use {
            "simrat39/rust-tools.nvim",
            commit = "86a2b4e31f504c00715d0dd082a6b8b5d4afbf03",
        }
        use {
            'saecki/crates.nvim',
            event = { "BufRead Cargo.toml" },
            requires = { "nvim-lua/plenary.nvim" },
            config = function() config("crates") end,
        }

        -- Code snippets.
        use {
            "L3MON4D3/LuaSnip",
            commit = "6e506ce63b7bebd1d4cb2243e0ab67abe82d9594",
        }

        -- Language server protocol.
        use {
            "neovim/nvim-lspconfig",
            commit = "12735ee94a3eca96c4ebb799a62a0a7aa4733107",
        }
        use {
            "williamboman/mason.nvim",
            commit = "beeb70f2ebaab18e7e031264c5a0f90bd8054628",
            config = function() config("mason") end,
        }
        use {
            "williamboman/mason-lspconfig.nvim",
            commit = "b70dedab5ceb5f3f84c6bc9ceea013292a14f8dc",
            config = function() config("mason-lspconfig") end,
        }
        use {
            "jose-elias-alvarez/null-ls.nvim",
            commit = "43cf6d732b4e7e550ce8f9f46570e5eb25a19025",
            config = function() config("null-ls") end,
        }
        use {
            "RRethy/vim-illuminate",
            commit = "1c8132dc81078fc1ec7a4a1492352b8f541ee84b",
            config = function() config("vim-illuminate") end,
        }

        -- Treesiter.
        use {
            "nvim-treesitter/nvim-treesitter",
            commit = "5891e2e1601237da229e5de6f242ad8616ea09d2",
            config = function() config("nvim-treesitter") end,
        }

        -- Telescope.
        use {
            "nvim-telescope/telescope.nvim",
            commit = "2584ff391b528d01bf5e8c04206d5902a79ebdde",
            config = function() config("telescope") end,
            requires = { "nvim-lua/plenary.nvim" }
        }

        if bootstraped then
            require("packer").sync()
        end
    end
end

function M.setup()
    local bootstraped = install_packer()

    require("packer").startup(packer_startup(bootstraped))
end


return M 

