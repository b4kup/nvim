-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Esc>", "<cmd>w<CR>", { desc = "Save buffer" })

-- In terminal buffers, gf opens file in previous (editor) window instead of closing the terminal
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.keymap.set("n", "gf", function()
      local file = vim.fn.expand("<cfile>")
      if file == "" then
        return
      end
      vim.cmd("wincmd p")
      vim.cmd("edit " .. vim.fn.fnameescape(file))
    end, { buffer = true, desc = "Go to file in editor window" })
  end,
})

vim.keymap.set("n", "<leader>sn", function()
  local ft = vim.bo.filetype
  local path = vim.fn.stdpath("config") .. "/snippets/" .. ft .. ".json"
  vim.cmd("edit " .. path)
end, { desc = "Edit snippets for filetype" })
