vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.cmd("set hidden")
vim.opt.swapfile = false
map("n", "<leader>q", ":q!<CR>")
vim.opt.list = true
vim.opt.listchars:append({ tab = "│ " })
