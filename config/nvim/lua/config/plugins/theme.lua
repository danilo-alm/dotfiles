local M = {}

function M.setup()
	vim.pack.add({
		"https://github.com/loctvl842/monokai-pro.nvim",
	})

	require("monokai-pro").setup({ transparent_background = false, filter = "spectrum" })
	vim.cmd("colorscheme monokai-pro")
end

return M