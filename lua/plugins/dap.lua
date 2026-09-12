return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.codelldb = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
			}

			-- Essential Keymaps
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate" })
			-- vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })

			dap.configurations.cpp = {
				{
					name = "Launch with Optional Args",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					-- New dynamic args function
					args = function()
						local args_string = vim.fn.input("Arguments: ")
						if args_string ~= "" then
							-- Split the input string into a table (needed by DAP)
							return vim.split(args_string, " ")
						end
						return {} -- Return empty table if no args provided
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end,
	},
	{
		"igorlfs/nvim-dap-view",
		lazy = false,
		opts = {
			auto_toggle = true,
		},
	},
}
