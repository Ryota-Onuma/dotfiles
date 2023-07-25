require("mason").setup()

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq", "goimports", "gofumpt", "sqlfmt", "yamlfmt", "prettier", "black" },
	handlers = {},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"cssls",
		"docker_compose_language_service",
		"dockerls",
		"eslint",
		"gopls",
		"graphql",
		"html",
		"jedi_language_server",
		"jsonls",
		"lua_ls",
		"marksman",
		"spectral",
		"sqlls",
		"tflint",
		"tsserver",
		"yamlls",
	},
})

local lspconfig = require("lspconfig")
lspconfig.cssls.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.dockerls.setup({})
lspconfig.eslint.setup({})
lspconfig.gopls.setup({})
lspconfig.graphql.setup({})
lspconfig.html.setup({})
lspconfig.jedi_language_server.setup({})
lspconfig.jsonls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.marksman.setup({})
lspconfig.ruby_ls.setup({})
lspconfig.spectral.setup({})
lspconfig.sqlls.setup({})
lspconfig.tflint.setup({})
lspconfig.tsserver.setup({})
lspconfig.yamlls.setup({})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.yamlfmt,
		null_ls.builtins.formatting.sqlfmt,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.eslint,
	},
})

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format(nil, 1500)]])
