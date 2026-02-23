-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	config = function()
		local neotree = require("neo-tree")
		neotree.setup({
			-- Enable a clickable source selector
			source_selector = {
				winbar = true,
				statusline = true,
				sources = { -- 定义显示的顺序和名称
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
				["B"] = {
					function()
						vim.api.nvim_command("Neotree focus buffers left")
					end,
					desc = "Switch to Buffers",
				},
				["G"] = {
					function()
						vim.api.nvim_command("Neotree focus git_status left")
					end,
					desc = "Switch to Git Status",
				},
				["F"] = {
					function()
						vim.api.nvim_command("Neotree focus filesystem left")
					end,
					desc = "Switch to Filesystem",
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
	keys = {
		{ "<leader>ee", ":Neotree toggle<CR>", desc = "Toggle NeoTree", silent = true },
	},
	-- opts = {
	-- 	filesystem = {
	-- 		window = {
	-- 			mappings = {
	-- 				["\\"] = "close_window",
	-- 			},
	-- 		},
	-- 	},
	-- },
}
