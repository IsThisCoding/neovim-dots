local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
map = vim.keymap.set
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.notify("auto starting treesitter")
		vim.treesitter.start()
	end,
})
require("vim-options")
require("lazy").setup("plugins")
