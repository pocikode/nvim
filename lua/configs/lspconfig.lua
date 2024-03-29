local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

-- C/C++
lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

-- CMake
lspconfig.cmake.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Javascript / Typescript
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})

-- Python
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})
