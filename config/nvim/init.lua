vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })

local keymaps = require('config.keymaps')
local opts = require('config.set')

keymaps.setup()
opts.setup()

local scan = require("plenary.scandir")
local plugins_dir = vim.fn.stdpath("config") .. "/lua/config/plugins"

for _, file in ipairs(scan.scan_dir(plugins_dir, { depth = 1 })) do
  local name = file:match("([^/]+)%.lua$")
  if name then
    local ok, mod = pcall(require, "config.plugins." .. name)
    if ok and type(mod.setup) == "function" then
      mod.setup()
    end
  end
end
