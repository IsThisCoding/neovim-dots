return {
  "leath-dub/snipe.nvim",
  keys = {
    {
      "gb",
      function() require("snipe").open_buffer_menu() end,
      desc = "Open Snipe buffer menu",
    },
  },
  opts = {},
  config = function(_, opts)
    local snipe = require("snipe")
    snipe.setup(opts) -- ensure setup is run

    -- Create a dedicated Menu instance
    local menu = require("snipe.menu"):new { position = "center" }

    -- Define Close-on-ESC behavior for the menu buffer
    menu:add_new_buffer_callback(function(m)
      vim.keymap.set("n", "<esc>", function()
        m:close()
      end, { nowait = true, buffer = m.buf })
    end)

    -- Override vim.ui.select to use this menu
    vim.ui.select = function(items, select_opts, on_choice)
      menu:open(items, select_opts, on_choice)
    end
  end,
}
