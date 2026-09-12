return {
	"barrettruth/live-server.nvim",

	config = function()
		vim.keymap.set("n", "<leader>lt", ":LiveServerToggle<CR>")
	end,
}
