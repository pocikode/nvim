return {
  { "giuxtaposition/blink-cmp-copilot" },

  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat" },
    dependencies = {
      "ravitemer/mcphub.nvim",
    },
    opts = {},
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = require "configs.copilot",
  },

  -- Use to render the markdown in the chat buffer
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },

  -- Use to render the markdown in the chat buffer
  {
    "OXY2DEV/markview.nvim",
    events = "VeryLazy",
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },

  -- Use for a cleaner diff when using the inline assistant or the @insert_edit_into_file tool
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require "mini.diff"
      diff.setup {
        -- Disabled by default
        source = diff.gen_source.none(),
      }
    end,
  },
}
