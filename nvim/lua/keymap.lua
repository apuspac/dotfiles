local vim = vim

-- auto complete
-- vim.keymap.set("i", "{", "{}<Left>", { noremap = true, silent = true })
-- vim.keymap.set("i", "[", "[]<Left>", { noremap = true, silent = true })
-- vim.keymap.set("i", "(", "()<Left>", { noremap = true, silent = true })
-- vim.keymap.set("i", "'", "''<Left>", { noremap = true, silent = true })
-- vim.keymap.set("i", '"', '""<Left>', { noremap = true, silent = true })

-- buffer move
-- barbar.nvim で代用
-- vim.keymap.set("n", "<S-j>", [[:bp<CR>]], { noremap = true })
-- vim.keymap.set("n", "<S-k>", [[:bn<CR>]], { noremap = true })
-- vim.keymap.set("n", "[b", [[:bp<CR>]], { noremap = true })
-- vim.keymap.set("n", "]b", [[:bn<CR>]], { noremap = true })
-- vim.keymap.set("n", "[d", [[:bd<CR>]], { noremap = true })

-- quick fix
vim.keymap.set("n", "[q", [[:cprev<CR>]], { noremap = true })
vim.keymap.set("n", "]q", [[:cnext<CR>]], { noremap = true })




