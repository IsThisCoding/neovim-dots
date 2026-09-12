return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			file_ignore_patterns = { "^./.git" },
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "plugins help" })
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "find references" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "find document symbols" })
			vim.keymap.set("n", "<leader>fps", builtin.lsp_dynamic_workspace_symbols, { desc = "find project symbols" })
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "go to symbol defenition" })
			vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "change colorscheme" })
			vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "find errors" })

			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			-- this will download prebuild binary or try to use existing rustup toolchain to build from source
			-- (if you are using lazy you can use gb for rebuilding a plugin if needed)
			require("fff.download").download_or_build_binary()
		end,
		-- if you are using nixos
		-- build = "nix run .#release",
		opts = { -- (optional)
			debug = {
				enabled = true, -- we expect your collaboration at least during the beta
				show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
			},
		},
		-- No need to lazy-load with lazy.nvim.
		-- This plugin initializes itself lazily.
		lazy = false,
		keys = {
			{
				"ff", -- try it if you didn't it is a banger keybinding for a picker
				function()
					require("fff").find_files()
				end,
				desc = "FFFind files",
			},
		},
	},
}
