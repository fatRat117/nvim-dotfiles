-- ============================================================
-- Mini.nvim Configuration
-- ============================================================

return {
    {
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings
            require("mini.surround").setup()

            -- Statusline
            local statusline = require("mini.statusline")
            statusline.setup({
                content = { active = nil, inactive = nil },
                use_icons = vim.g.have_nerd_font,
            })

            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return "%2l:%-2v"
            end

            -- Autopairs
            require("mini.pairs").setup({
                modes = { insert = true, command = false, terminal = false },
                mappings = {
                    ["("] = { action = "open", pair = "()", neigh_pattern = "^[^\\]" },
                    ["["] = { action = "open", pair = "[]", neigh_pattern = "^[^\\]" },
                    ["{"] = { action = "open", pair = "{}", neigh_pattern = "^[^\\]" },
                    [")"] = { action = "close", pair = "()", neigh_pattern = "^[^\\]" },
                    ["]"] = { action = "close", pair = "[]", neigh_pattern = "^[^\\]" },
                    ["}"] = { action = "close", pair = "{}", neigh_pattern = "^[^\\]" },
                    ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "^[^\\]", register = { cr = false } },
                    ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "^[^%a\\]", register = { cr = false } },
                    ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "^[^\\]", register = { cr = false } },
                },
            })
        end,
    },
}
