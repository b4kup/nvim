-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Esc>", "<cmd>w<CR>", { desc = "Save buffer" })

vim.keymap.set("n", "<leader>sn", function()
  local ft = vim.bo.filetype
  local path = vim.fn.stdpath("config") .. "/snippets/" .. ft .. ".json"
  vim.cmd("edit " .. path)
end, { desc = "Edit snippets for filetype" })
