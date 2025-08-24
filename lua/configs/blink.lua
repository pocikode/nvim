return {
  sources = {
    default = { "copilot" },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
        score_offset = 100,
        async = true,
      },
    },
    per_filetype = {
      codecompanion = { "codecompanion" },
    },
  },
}
