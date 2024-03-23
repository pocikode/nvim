return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
},

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function ()
      return require "configs.mason"
    end,
  },

  {
  "neovim/nvim-lspconfig",
   config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
   end,
},

}
