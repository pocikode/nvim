-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- delete default keymap
del("n", "<leader>wd")
del("n", "<leader>wm")
del("n", "<leader>/")

-- bufferline
map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<leader>w", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- cmdline
map("n", ";", ":<c-u>")

-- comment
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- neo tree
map("n", "<leader>e", "<cmd>Neotree action=focus<cr>", { desc = "NeoTree Focus Window" })
map("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "NeoTree Toggle Window" })

-- toggle copilot
Snacks.toggle({
  name = "Copilot Completion",
  color = {
    enabled = "azure",
    disabled = "orange",
  },
  get = function()
    return not require("copilot.client").is_disabled()
  end,
  set = function(state)
    if state then
      require("copilot.command").enable()
    else
      require("copilot.command").disable()
    end
  end,
}):map("<leader>at")
