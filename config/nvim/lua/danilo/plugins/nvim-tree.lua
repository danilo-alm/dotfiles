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
      git = {
        ignore = false,
      },
    })
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>")
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
    keymap.set("n", "<C-Left>", "<cmd>NvimTreeResize -5<CR>")
    keymap.set("n", "<C-Right>", "<cmd>NvimTreeResize +5<CR>")
  end,
}
