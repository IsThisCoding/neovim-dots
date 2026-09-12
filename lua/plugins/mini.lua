return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		--[[ Actions (text editing actions are dot-repeatable out of the box and respect [count]) with configurable mappings:

    Add surrounding with sa (in visual mode or on motion).
    Delete surrounding with sd.
    Replace surrounding with sr.
    Find surrounding with sf or sF (move cursor right or left).
    Highlight surrnding with sh.
    Change number of neighbor lines with sn (see :h MiniSurround-algorithm). ]]

		require("mini.basics").setup()
		require("mini.surround").setup()
		require("mini.operators").setup()
		require("mini.basics").setup()
		require("mini.files").setup()
		require("mini.comment").setup()
		require("mini.pairs").setup()
		require("mini.hipatterns").setup()

		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
		require("mini.statusline").setup()
		require("mini.starter").setup()

		vim.keymap.set("n", "<leader>-", function()
			if MiniFiles.close() then
				MiniFiles.close()
			else
				MiniFiles.open()
			end
		end, { desc = "Open file explorer" })
		require("mini.icons").setup()
	end,
}
