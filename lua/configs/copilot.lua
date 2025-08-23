local M = {}

M.opts = {
  enabled = false,
  auto_trigger = true,
  hide_during_completion = true,
  keymap = {
    accept = false,
    next = "<M-]>",
    prev = "<M-[>",
  },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
  },
}

M.blink_opts = {
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
  },
}

return M
