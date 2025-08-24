-- dofile(vim.g.base46_cace .. "lsp")
require("nvchad.lsp").diagnostic_config()

-- setup language servers
local servers = {
  "clangd",
  "docker_language_server",
  "gopls",
  "jsonls",
  "nil_ls",
  "pyright",
  "ruff",
  "ruff-lsp",
  "yamlls",
}
vim.lsp.enable(servers)
vim.lsp.inlay_hint.enable(true)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })
