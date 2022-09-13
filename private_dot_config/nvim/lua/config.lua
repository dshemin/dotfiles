-- NeoVim customization.

local M = {}

local function bind_keys()
    local map = vim.keymap.set

    --Remap space as leader key
    map("", "<Space>", "<Nop>", opts)
    vim.g.mapleader = " "

    -- Move to the end of the line.
    map("n", "<C-E>", "$")
    map("n", "<LEADER><RIGHT>", "$")
    map("i", "<C-E>", "<Esc>A")

    -- Move to the begginig of the line.
    map("n", "<C-A>", "^")
    map("n", "<LEADER><LEFT>", "^")
    map("i", "<C-A>", "<Esc>I")

    -- Change ident by Tab and Shift-Tab.
    map("n", "<Tab>", ">>_")
    map("n", "<S-Tab>", "<<_")
    map("i", "<S-Tab>", "<C-D>")
    map("v", "<Tab>", ">gv")
    map("v", "<S-Tab>", "<gv")

    -- Close current buffer.
    map({"n", "i", "v"}, "<C-Q>", "<ESC><CMD>bdelete<CR>")
end

local function setup_ui()
    local o = vim.opt
    local cmd = vim.cmd
    local hi = function(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    o.fileencoding = "utf-8"

    -- Highlight column.
    o.colorcolumn = "100"

    -- Show whitespace and tabs.
    o.listchars = {
       tab = "━━",
       multispace = "･",
       trail = "･",
    }
    o.list = true

    -- Setup color schema.
    o.termguicolors = true
    cmd("colorscheme darcula")

    -- Fix color schema.
    hi("Normal", { bg="#222222" })

    local illuminateOpts = {
        bg="#323232",
        bold=true,
    }
    hi("IlluminatedWordText", illuminateOpts)
    hi("IlluminatedWordRead", illuminateOpts)
    hi("IlluminatedWordWrite", illuminateOpts)
end

function M.setup()
    local o = vim.opt

    -- Show numbers on the left-side of the screen, 4 characters width.
    o.number = true
    o.numberwidth = 4
    o.signcolumn = "yes"

    -- Use space instead of tab and configure default tab length.
    o.tabstop = 4
    o.shiftwidth = 4
    o.expandtab = true

    -- Disable backup files.
    o.backup = false

    -- Use GUI color in terminal.
    o.termguicolors = true

    -- Highlight cursor line.
    o.cursorline = true

    -- Hide mode.
    o.showmode = false

    bind_keys()
    setup_ui()
end

return M

