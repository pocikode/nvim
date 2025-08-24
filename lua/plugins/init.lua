return {
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false,
  },

  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    opts = require "configs.clangd_extensions",
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = function()
      dofile(vim.g.base46_cache .. "notify")
      return require "configs.noice"
    end,
  },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "saghen/blink.cmp",
    opts = require "configs.blink",
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
}
