return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					diagnostics = "nvim_lsp",
					style_preset = bufferline.style_preset.no_italic,
					offsets = {
						{
							filetype = "NvimTree",
							text = function()
								return vim.fn.getcwd()
							end,
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
			})
		end,
	},
}
