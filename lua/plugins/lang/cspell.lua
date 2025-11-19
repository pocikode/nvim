return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      vim.lsp.enable("cspell_ls"),
      vim.lsp.config("cspell_ls", {
        cmd = { "cspell-lsp", "--stdio" },
        filetypes = {
          "plaintext",
          "markdown",
          "tex",
          "tex.latex",
          "lua",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
          "yaml",
          "gitcommit",
          "go",
          "c",
          "cpp",
        },
        root_markers = { ".git", ".cspell.json", "cspell.json", ".cspell.yaml", "cspell.yaml" },
      }),
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "cspell", "cspell-lsp" } },
  },
}
