-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>aa", "<cmd>Alpha<CR>", { desc = "Go to Alpha Menu" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>fa",
  ":lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git/' }, cwd = '~/Documents/repositories/' })<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc><Esc>", "<Esc>")
