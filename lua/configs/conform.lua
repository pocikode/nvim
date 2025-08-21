local options = {
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    lua = { "stylua" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
