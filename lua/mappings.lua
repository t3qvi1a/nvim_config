require("nvchad.mappings")
local map = vim.keymap.set

-- general settings
map("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
map("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-s>", "<cmd>wa<CR>", { desc = "general save file" })
map("i", "<C-s>", "<cmd>wa<CR>", { desc = "general save file" })
map("t", "<C-s>", "<C-\\><C-N>:wa<cr>")
map("n", "<C-q>", ":qa<cr>")
map("t", "<C-q>", "<C-\\><C-N>:qa<cr>")
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map({ "n", "i", "v" }, "<C-z>", "<cmd> undo <cr>", { desc = "history undo" })
map({ "n", "i", "v" }, "<C-y>", "<cmd> redo <cr>", { desc = "history redo" })

-- delete all content
map("n", "<A-d>", "ggvGddd")

-- terminal mode movement
map("t", "<C-k>", "<C-\\><C-N>", { desc = "move up" })

-- new terminals
-- new window
map("n", "<leader>h", "<C-w>v")
map("n", "<leader>v", "<C-w>s")

-- multiple line moving
-- map("v", "J", ":m '>+1<CR>gv=gv")
-- map("v", "K", ":m '<-1<CR>gv=gv")

map("n", "<A-j>", function()
    require("nvchad.term").new({ pos = "sp" })
end, { desc = "terminal new horizontal term" })

-- Nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

-- quit terminal mode
map("t", "<A-j>", "<C-\\><C-N>:q<cr>", { desc = "terminal escape terminal mode" })

-- Telescope
map("n", "<A-p>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "telescope find a word" })
