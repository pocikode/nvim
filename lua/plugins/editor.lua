return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>w", group = false, proxy = false, expand = false },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
    },
  },
}
