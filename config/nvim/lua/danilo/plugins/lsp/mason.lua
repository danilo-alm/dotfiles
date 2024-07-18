return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- bridge between mason and lsp
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim", -- bridge between mason and dap
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_nvim_dap = require("mason-nvim-dap")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"lua_ls",
				"graphql",
				"pyright",
				"clangd", -- C
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				"bashls",
				"gradle_ls",
				"jsonls", -- json
				"marksman", -- markdown
				"sqlls", -- sql
				"hydra_lsp", -- yaml
				"jdtls", -- java
				"asm_lsp", -- assembly
                "cmake"
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_nvim_dap.setup({
			ensure_installed = {
				"java-test",
				"java-debug-adapter",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
                "cmakelang"
			},
		})
	end,
}
