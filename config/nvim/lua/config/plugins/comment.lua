local M = {}

function M.setup()
	vim.pack.add({
        "https://github.com/numToStr/Comment.nvim",
    })

    require("Comment").setup({
        toggler = {
            line = "<leader>gc",
            block = "<leader>gb",
        },
    })
end

return M

