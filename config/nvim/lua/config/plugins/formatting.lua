local M = {}

function M.setup()
	vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			typescript = { "eslint" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			lua = { "stylua" },
			python = function(bufnr)
				if conform.get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,
			cpp = { "clang-format" },
		},
	})

	vim.keymap.set({ "n", "v" }, "<leader>f", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout = 500,
		})
	end, {
		desc = "Format file or range (in visual mode)",
	})
end

return M
