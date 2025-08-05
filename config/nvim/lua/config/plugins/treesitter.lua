local M = {}

function M.setup()
    vim.pack.add({
        "https://github.com/nvim-treesitter/nvim-treesitter",
    })

    local ts_parsers = {"bash", "c", "dockerfile", "fish", "git_config", "git_rebase", "gitattributes", "gitcommit",
        "gitignore", "go", "gomod", "gosum", "html", "javascript", "json", "lua", "make", "markdown", "python", "rust",
        "sql", "toml", "tsx", "typescript", "typst", "vim", "yaml", "prisma",
    }

	require("nvim-treesitter.configs").setup({
		ensure_installed = ts_parsers,
		highlight = { enable = true },
	})
end

return M
