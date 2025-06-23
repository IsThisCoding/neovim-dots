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
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Setup Mason-LSPconfig
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "ruff",
          "jdtls",
          "basedpyright",
          "jsonls",
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
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "get def in buf" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end, { desc = "Show Error at Cursor" })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
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
      require("lspconfig").qmlls.setup({
        cmd = { "qmlls6", "-E" },
      })
      -- Show errors and warnings in a floating window
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
        end,
      })
    end
  }
}
