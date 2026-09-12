return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				-- optional configuration here
				overrides = {
					BlinkCmpMenuSelection = { bg = "#2e323a", fg = "#none", bold = true },
					PmenuSel = { bg = "#2e323a", fg = "#none" },
				},
			})
			vim.cmd("colorscheme vague")
		end,
	},
}
