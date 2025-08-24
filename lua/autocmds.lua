require "nvchad.autocmds"

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
  callback = function(event)
    local opts = function(desc)
      return { buffer = event.buf, desc = "LSP " .. desc }
    end

    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "gr", vim.lsp.buf.references, opts "References")
    map("n", "gI", vim.lsp.buf.implementation, opts "Go to implementation")
    map("n", "gy", vim.lsp.buf.type_definition, opts "Go to type definition")
    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "K", vim.lsp.buf.hover, opts "Hover")
    map("n", "gK", vim.lsp.buf.signature_help, opts "Signature help")
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
    map("n", "<leader>cc", vim.lsp.codelens.run, opts "Run Codelens")
    map("n", "<leader>CC", vim.lsp.codelens.refresh, opts "Refresh & Display Codelens")
    map("n", "<leader>cr", require "nvchad.lsp.renamer", opts "NvRenamer")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  end,
})
