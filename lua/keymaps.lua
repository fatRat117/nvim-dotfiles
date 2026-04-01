-- ============================================================
-- Neovim Keymaps Configuration
-- ============================================================

local keymap = vim.keymap

-- ----------------------------------------------------------------
-- Insert Mode
-- ----------------------------------------------------------------
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- ----------------------------------------------------------------
-- Normal Mode
-- ----------------------------------------------------------------

-- Number increment/decrement
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Buffer management
keymap.set("n", "<leader>b", "<cmd>Bufferin<cr>", { desc = "Toggle Bufferin" })

-- ----------------------------------------------------------------
-- Terminal Mode
-- ----------------------------------------------------------------
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ----------------------------------------------------------------
-- Autocommands
-- ----------------------------------------------------------------

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("user-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Restore cursor position",
    group = vim.api.nvim_create_augroup("user-restore-cursor", { clear = true }),
    pattern = "*",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
