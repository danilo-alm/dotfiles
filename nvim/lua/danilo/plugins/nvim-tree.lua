return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
	config = function()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

	-- optionally enable 24-bit colour
	vim.opt.termguicolors = true

	-- OR setup with some options
	require("nvim-tree").setup({
	  sort = {
	    sorter = "case_sensitive",
	  },
	  view = {
	    width = 30,
	  },
	  renderer = {
	    group_empty = true,
	  },
	  filters = {
	    dotfiles = true,
	  },
	})
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = " Open the tree if it is closed, and then focus on the tree." })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
