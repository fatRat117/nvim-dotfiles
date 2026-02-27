-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	-- 'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

	"rebelot/kanagawa.nvim",
	"ellisonleao/gruvbox.nvim",
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},

	require("plugins.bufferin"),

	require("plugins.noice"),

	require("plugins.alpha"),

	require("plugins.bufferline"),

	require("plugins.colorful-menu"),

	require("plugins.wakatime"),

	require("plugins.gitsigns"),

	require("plugins.which-key"),

	require("plugins.telescope"),

	require("plugins.lspconfig"),

	require("plugins.lspsaga"),

	require("plugins.conform"),

	require("plugins.blink-cmp"),

	--   require 'kickstart.plugins.todo-comments',

	require("plugins.mini"),

	require("plugins.treesitter"),

	-- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. If you want these files, they are in the repository, so you can just download them and
	-- place them in the correct locations.

	-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
	--
	--  Here are some example plugins that I've included in the Kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'kickstart.plugins.debug',
	require("plugins.indent_line"),
	-- require 'kickstart.plugins.lint',
	require("plugins.autopairs"),
	require("plugins.neo-tree"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
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

-- vim: ts=2 sts=2 sw=2 et
