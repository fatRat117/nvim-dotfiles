-- ============================================================
-- Neo-tree File Explorer Configuration
-- ============================================================

return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree", silent = true },
    },
    config = function()
        require("neo-tree").setup({
            source_selector = {
                winbar = true,
                statusline = true,
                sources = {
                    { source = "filesystem", display_name = " 󰉓 Files " },
                    { source = "buffers", display_name = " 󰈙 Buffers " },
                    { source = "git_status", display_name = " 󰊢 Git " },
                    { source = "document_symbols", display_name = "  Symbols" },
                },
            },
            close_if_last_window = true,
            window = {
                width = 30,
                mappings = {
                    ["space"] = "none",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = { enable = true },
            },
        })
    end,
}
