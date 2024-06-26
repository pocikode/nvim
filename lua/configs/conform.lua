local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		python = { "isort", "black" },
    c = { "clang_format" },
    go = { "goimports", "gofmt" },
	},
}

require("conform").setup(options)
