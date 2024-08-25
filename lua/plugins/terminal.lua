return {
	"CRAG666/betterTerm.nvim",
	opts = {
		position = "bot",
		size = 15,
	},
	config = function()
		local betterTerm = require("betterTerm")
		vim.keymap.set({ "n", "t" }, "<C-;>", betterTerm.open, { desc = "Open terminal" })
		vim.keymap.set({ "n" }, "<leader>tt", betterTerm.select, { desc = "Select terminal" })
		local current = 2
		vim.keymap.set({ "n" }, "<leader>tn", function()
			betterTerm.open(current)
			current = current + 1
		end, { desc = "New terminal" })
		require("betterTerm").setup({
			prefix = "Term_",
			startInserted = false,
			position = "bot",
			size = 18,
		})
	end,
}
