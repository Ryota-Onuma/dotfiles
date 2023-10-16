require("mason").setup()

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq", "goimports", "gofumpt", "sql-formatter", "yamlfmt", "prettier", "black" },
	handlers = {},
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
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
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.cmd([[autocmd Filetype go autocmd BufWritePre *.go lua vim.lsp.buf.format(nil, 1500)]])
vim.cmd([[autocmd Filetype javascript autocmd BufWritePre *.js lua vim.lsp.buf.format(nil, 1500)]])
vim.cmd([[autocmd Filetype json autocmd BufWritePre *.json lua vim.lsp.buf.format(nil, 1500)]])
vim.cmd([[autocmd Filetype lua autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 1500)]])
vim.cmd([[autocmd Filetype python autocmd BufWritePre *.py lua vim.lsp.buf.format(nil, 1500)]])
vim.cmd([[autocmd Filetype typescript autocmd BufWritePre *.ts lua vim.lsp.buf.format(nil, 1500)]])
vim.cmd([[autocmd Filetype yaml autocmd BufWritePre *.yaml lua vim.lsp.buf.format(nil, 1500)]])
vim.cmd([[autocmd Filetype yml autocmd BufWritePre *.yml lua vim.lsp.buf.format(nil, 1500)]])
vim.cmd([[autocmd Filetype sql autocmd BufWritePre *.sql lua vim.lsp.buf.format(nil, 1500)]])


local lspconfig = require("lspconfig")
lspconfig.cssls.setup({
	capabilities = capabilities,
})
lspconfig.docker_compose_language_service.setup({
	capabilities = capabilities,
})
lspconfig.dockerls.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
})
lspconfig.gopls.setup({
	capabilities = capabilities,
})
lspconfig.graphql.setup({
	capabilities = capabilities,
})
lspconfig.html.setup({
	capabilities = capabilities,
})
lspconfig.jedi_language_server.setup({
	capabilities = capabilities,
})
lspconfig.jsonls.setup({
	capabilities = capabilities,
})
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.marksman.setup({
	capabilities = capabilities,
})
lspconfig.ruby_ls.setup({
	capabilities = capabilities,
})
lspconfig.spectral.setup({
	capabilities = capabilities,
})
lspconfig.sqlls.setup({
	capabilities = capabilities,
})
lspconfig.tflint.setup({
	capabilities = capabilities,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-n>"] = cmp.mapping.scroll_docs(4),
		["<C-c>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.yamlfmt,
		null_ls.builtins.formatting.sqlformat,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.eslint,
	},
})
