-- ============================================================
-- Plugin Management with lazy.nvim
-- ============================================================

require("lazy").setup({
    -- =========================================================
    -- Colorschemes
    -- =========================================================
    { "rebelot/kanagawa.nvim", lazy = true },
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        opts = { transparent = true },
    },

    -- =========================================================
    -- UI Enhancements
    -- =========================================================
    require("plugins.alpha"),        -- Dashboard
    require("plugins.bufferline"),   -- Buffer line
    require("plugins.noice"),        -- Better UI for messages, cmdline, popupmenu
    require("plugins.colorful-menu"), -- Colorful completion menu

    -- =========================================================
    -- File Management
    -- =========================================================
    require("plugins.neo-tree"),     -- File explorer
    require("plugins.bufferin"),     -- Buffer list

    -- =========================================================
    -- Search & Navigation
    -- =========================================================
    require("plugins.telescope"),    -- Fuzzy finder
    require("plugins.which-key"),    -- Keymap helper

    -- =========================================================
    -- LSP & Completion
    -- =========================================================
    require("plugins.lspconfig"),    -- LSP configuration
    require("plugins.lspsaga"),      -- LSP UI enhancements
    require("plugins.blink-cmp"),    -- Autocompletion
    require("plugins.conform"),      -- Formatting

    -- =========================================================
    -- Syntax & Treesitter
    -- =========================================================
    require("plugins.treesitter"),   -- Syntax highlighting
    require("plugins.indent_line"),  -- Indentation guides

    -- =========================================================
    -- Git Integration
    -- =========================================================
    require("plugins.gitsigns"),     -- Git signs in gutter

    -- =========================================================
    -- Editor Enhancements
    -- =========================================================
    require("plugins.mini"),         -- Collection of small plugins

    -- =========================================================
    -- Utilities
    -- =========================================================
    require("plugins.wakatime"),     -- Time tracking

}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
