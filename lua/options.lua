-- ============================================================
-- Neovim Options Configuration
-- ============================================================

local opt = vim.opt

-- ----------------------------------------------------------------
-- UI Settings
-- ----------------------------------------------------------------
opt.number = true
opt.relativenumber = false
opt.mouse = "a"
opt.showmode = false
opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.confirm = true

-- List characters (show tabs, trailing spaces, etc.)
opt.list = true
opt.listchars = {
    tab = "▏ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "␣",
}

-- ----------------------------------------------------------------
-- Editor Behavior
-- ----------------------------------------------------------------
opt.breakindent = true
opt.undofile = true
opt.wrap = false

-- Update timing
opt.updatetime = 250
opt.timeoutlen = 300

-- Command line preview
opt.inccommand = "split"

-- ----------------------------------------------------------------
-- Indentation & Tabs
-- ----------------------------------------------------------------
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- ----------------------------------------------------------------
-- Text Formatting
-- ----------------------------------------------------------------
opt.textwidth = 80
opt.formatoptions:append("a")

-- ----------------------------------------------------------------
-- Search Settings
-- ----------------------------------------------------------------
opt.ignorecase = true
opt.smartcase = true

-- ----------------------------------------------------------------
-- Clipboard
-- ----------------------------------------------------------------
opt.clipboard:append("unnamedplus")

-- ----------------------------------------------------------------
-- Netrw Settings
-- ----------------------------------------------------------------
vim.g.netrw_liststyle = 3

-- ----------------------------------------------------------------
-- Custom Highlights
-- ----------------------------------------------------------------
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#fabd2f" })
