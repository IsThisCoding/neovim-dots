return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		vim.opt.termguicolors = true
		require("nvim-highlight-colors").setup({
			render = "background",
			virtual_symbol = "●",
			virtual_symbol_position = "inline",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			exclude_filetypes = {},
			exclude_buftypes = {},
		})
	end,
}
