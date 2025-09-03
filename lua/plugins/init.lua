return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    event = "VeryLazy",
  },

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
    opts_extend = { "spec" },
    opts = require "configs.whichkey",
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = { mode = "cursor", max_lines = 3 },
  },

  {
    "saghen/blink.cmp",
    opts = require "configs.blink",
  },

  {
    "SmiteshP/nvim-navbuddy",
    cmd = "Navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = { lsp = { auto_attach = true } },
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
}
