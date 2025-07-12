return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>gc",
				---Block-comment toggle keymap
				block = "<leader>gb",
			},
		})
	end,
}
