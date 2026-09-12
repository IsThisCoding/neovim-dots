return {
	{
		"nvim-java/nvim-java",
		config = function()
			require("java").setup()
			map("n", "<leader>jta", "<cmd>JavaTestRunCurrentClass<cr>", { desc = "java test all class tests" })
			map("n", "<leader>jta", "<cmd>JavaTestRunCurrentMethod<cr>", { desc = "java test current method" })
			vim.lsp.config.jdtls.setup({})
		end,
	},
	-- {
	-- 	"mfussenegger/nvim-jdtls",
	-- },
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
		dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = vim.lsp.config
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- Setup Mason-LSPconfig
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"ruff",
					"basedpyright",
					"jsonls",
					"vtsls",
					"vue_ls",
				},
				automatic_enable = {
					exclude = {
						"jdtls",
						"rust_analyzer",
						"vtsls",
						"vue_ls",
					},
				},
			})

			vim.lsp.config("basedpyright", {
				root_dir = function(bufnr, on_dir)
					local root = vim.fs.root(bufnr, { "pyproject.toml", "setup.py" })
					on_dir(root)
				end,
			})

			-- Vue support: vtsls handles TS/JS + Vue (via @vue/typescript-plugin),
			-- vue_ls runs alongside in hybrid mode for SFC/template features
			local vue_language_server_path = vim.fn.stdpath("data")
				.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

			local vue_plugin = {
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
			}

			vim.lsp.config.vtsls = {
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = { vue_plugin },
						},
					},
				},
			}
			vim.lsp.enable("vtsls")

			vim.lsp.config.vue_ls = {
				capabilities = capabilities,
				filetypes = { "vue" },
				init_options = {
					vue = {
						hybridMode = true,
					},
				},
			}
			vim.lsp.enable("vue_ls")

			-- Custom key mappings for LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover def" })
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "get def in buf" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", function()
				vim.diagnostic.open_float(nil, { focusable = false })
			end, { desc = "Show Error at Cursor" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp", "nvimdev/lspsaga.nvim" },
		lazy = false,
		init = function()
			vim.g.coq_settings = {
				auto_start = true, -- if you want to start COQ at startup
				-- Your COQ settings here
			}
		end,
		config = function()
			-- vim.lsp.config.qmlls.setup({
			-- 	cmd = { "qmlls6", "-E" },
			-- })
			-- Show errors and warnings in a floating window
			-- vim.lsp.config.jdtls.setup({})
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
				end,
			})
		end,
	},
	{
		-- "pmizio/typescript-tools.nvim",
		-- dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		-- opts = {},
	},
}
