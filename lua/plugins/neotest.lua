return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"atm1020/neotest-jdtls",
	},
	keys = {
		-- { "<leader>tr", "<cmd>Neotest run<cr>" },
		-- { "<leader>ti", "<cmd>Neotest output<cr>" },
		-- { "<leader>ts", "<cmd>Neotest summary<cr>" },
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jdtls"),
			},
		})
	end,
}
