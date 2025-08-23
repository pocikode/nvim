local stl_utils = require "nvchad.stl.utils"

local M = {}

M.stl_lsp = function()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if client.name ~= "copilot" and client.attached_buffers[stl_utils.stbufnr()] then
        return (vim.o.columns > 100 and "   LSP ~ " .. client.name .. " ") or "   LSP "
      end
    end
  end

  return ""
end

return M
