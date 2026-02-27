return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
				code_action = "💡",
			},

			hover = {
				max_width = 0.6,
				max_height = 0.6,
			},

			lightbulb = {
				enable = false,
			},

			symbol_in_winbar = {
				enable = false,
			},

			rename = {
				auto_save = true,
			},
		})

		-- ========== Keymaps ==========
		local keymap = vim.keymap.set

		-- 悬浮文档
		keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

		-- 跳转定义
		keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

		-- 查找引用
		keymap("n", "gr", "<cmd>Lspsaga finder<CR>")

		-- 重命名
		keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")

		-- 代码操作
		keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

		-- 诊断
		keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
		keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
	end,
}
