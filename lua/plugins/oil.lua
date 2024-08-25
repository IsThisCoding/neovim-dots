return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		require("oil").setup({
			columns = { "icon" },
			keymaps = {
				["C-h"] = false,
				["<M-h"] = "actions.select_split",
			},
			view_options = {
				show_hidden = true,
			},
		})
		--open parent dir in current window
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
	end,
}
