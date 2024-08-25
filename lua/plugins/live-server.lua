return {
	"ngtuonghy/live-server-nvim",
	event = "VeryLazy",
	build = ":LiveServerInstall",
	config = function()
		require("live-server-nvim").setup({
			require("live-server-nvim").setup({
				custom = {
					"--port=9999",
					"--no-css-inject",
				},
				serverPath = vim.fn.stdpath("data") .. "/live-server/", --default
				open = "folder", -- folder|cwd     --default
			}),
		})
		vim.keymap.set("n", "<leader>lt", function()
			require("live-server-nvim").toggle()
		end)
	end,
}
