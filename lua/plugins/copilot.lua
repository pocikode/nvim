return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = require("configs.copilot").opts,
  },

  { "giuxtaposition/blink-cmp-copilot" },

  {
    "saghen/blink.cmp",
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    opts = require("configs.copilot").blink_opts,
  },
}
