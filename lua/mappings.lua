require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Lazygit" })
map("n", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map("n", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map("v", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map("v", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map("i", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map("i", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map("i", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>i")
map("i", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>i")
map("n", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>i")
map("n", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>i")
-- Expand `cc` into CodeCompanion in the command line
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })                         -- toggle file explorer
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })                     -- collapse file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })                       -- refresh file explorer
vim.keymap.set(
    "n",
    "<leader>fz",
    "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
    { desc = "Fuzzy find in current buffer" }
)
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = "Live grep" })
