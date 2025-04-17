return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},

			formatters_by_ft = {
				lua = { "stylua" },
				-- svelte = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				java = { "google-java-format" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				bash = { "beautysh" },
				jsonc = { "prettierd", "prettier", stop_after_first = true },
				c = { "clang-format" },
				qml = { "prettierd", "prettuer", stop_after_first = true },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or (v) selection" })
	end,
}
