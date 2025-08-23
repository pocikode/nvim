require("nvchad.configs.lspconfig").defaults()

-- diagnostic config
vim.lsp.inlay_hint.enable(true)

-- setup language servers
local servers = { "clangd", "gopls", "nil_ls", "pyright", "ruff", "ruff-lsp" }
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

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = true,
    },
  },
})

vim.lsp.config("ruff", {
  settings = {
    cmd_env = { RUFF_TRACE = "messages" },
    init_options = {
      settings = {
        logLevel = "error",
      },
    },
  },
})
