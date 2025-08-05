local M = {}

function M.setup()
    vim.pack.add({
        "https://github.com/windwp/nvim-autopairs"
    })
    require('nvim-autopairs').setup()
end

return M
