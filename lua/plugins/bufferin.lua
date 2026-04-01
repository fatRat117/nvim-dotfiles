-- ============================================================
-- Bufferin Configuration
-- ============================================================

return {
    {
        "wasabeef/bufferin.nvim",
        cmd = { "Bufferin" },
        config = function()
            require("bufferin").setup()
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "willothy/nvim-cokeline",
            "akinsho/bufferline.nvim",
        },
    },
}
