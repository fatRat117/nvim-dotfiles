-- ============================================================
-- Neovim Configuration Entry Point
-- ============================================================

-- Set leader keys BEFORE loading any plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Feature flags
vim.g.have_nerd_font = true

-- Load configuration modules
require("options")
require("keymaps")
require("lazy-bootstrap")
require("lazy-plugins")

-- Set colorscheme
vim.cmd("colorscheme gruvbox")
