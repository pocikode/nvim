require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

vim.lsp.config("clangd", {
  settings = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },
})
