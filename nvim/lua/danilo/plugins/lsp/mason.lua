return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- act as bridge to lsp
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

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
		"jdtls", -- java
		"marksman", -- markdown
		"sqlls", -- sql
		"hydra_lsp" -- yaml
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })
  end,
}
