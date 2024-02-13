return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- bridge between mason and lsp
	"mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim" -- bridge between mason and dap
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
	local mason_nvim_dap = require("mason-nvim-dap")

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
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

	mason_nvim_dap.setup({
		ensure_installed = {
			"java-test",
			"java-debug-adapter",
		}
	})
  end,
}
