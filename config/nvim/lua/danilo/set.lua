vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.directory = { ".swp/", "~/.swp/", "/tmp//" } -- Swap file

vim.opt.scrolloff = 8

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true -- During search
vim.opt.smartcase = true -- Ignore previous if letter is capital

vim.opt.termguicolors = true

vim.opt.colorcolumn = { 80, 120 }

vim.opt.updatetime = 300

vim.g.term = "kitty"

vim.g.mapleader = " "

vim.filetype.add({
  pattern = { [".*/hyprland%.conf"] = "hyprlang" },
})
