-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>aa", "<cmd>Alpha<CR>", { desc = "Go to Alpha Menu" })
vim.keymap.set("n", "<leader>fa", function()
  return require("telescope.builtin").find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git/" } })
end, { desc = "Find including hidden" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc><Esc>", "<Esc>")
vim.keymap.set("n", "<leader>wb", function()
  vim.opt_local.scrollbind = not vim.opt_local.scrollbind:get()
end, { desc = "toggle scroll bind on current buffer" })
