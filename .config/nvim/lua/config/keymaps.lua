-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>aa", "<cmd>Alpha<CR>", { desc = "Go to Alpha Menu" })
vim.keymap.set("n", "<leader>fa", function()
  return require("telescope.builtin").find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git/" } })
end, { desc = "Find including hidden" })
