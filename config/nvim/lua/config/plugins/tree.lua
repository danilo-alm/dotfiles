local M = {}

function M.setup()
    vim.pack.add({
        "https://github.com/nvim-tree/nvim-tree.lua",
        "https://github.com/nvim-tree/nvim-web-devicons"
    })

    require("nvim-tree").setup({
        view = {
            width = 30
        },
        filters = {
            dotfiles = true
        },
        git = {
            ignore = false
        }
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>")
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
    keymap.set("n", "<C-Left>", "<cmd>NvimTreeResize -5<CR>")
    keymap.set("n", "<C-Right>", "<cmd>NvimTreeResize +5<CR>")
end

return M
