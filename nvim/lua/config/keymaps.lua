-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- LaTeX live preview
vim.keymap.set("n", "<leader>tc", "<cmd>VimtexCompile<cr>", { desc = "Start continuous compilation" })
vim.keymap.set("n", "<leader>tv", "<cmd>VimtexView<cr>", { desc = "Open PDF viewer (zathura)" })
vim.keymap.set("n", "<leader>tC", "<cmd>VimtexClean<cr>", { desc = "Clean auxiliary files" })
vim.keymap.set("n", "<leader>te", "<cmd>VimtexErrors<cr>", { desc = "Show errors/warnings" })
