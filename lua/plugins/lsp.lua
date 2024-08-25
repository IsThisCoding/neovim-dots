return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Setup Mason-LSPconfig
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"ruff",
					"jdtls",
				},
			})

			-- Automatically setup each LSP server installed by Mason
			mason_lspconfig.setup_handlers({
				function(server_name)
					-- Default handler for all servers
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})

			-- Custom key mappings for LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover def" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "get def in buf" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		init = function()
			vim.g.coq_settings = {
				auto_start = true, -- if you want to start COQ at startup
				-- Your COQ settings here
			}
		end,
		config = function()
			-- Your LSP settings here
		end,
	},
}
