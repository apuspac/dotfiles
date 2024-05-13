-- auto complete
vim.keymap.set("i", "{", "{}<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "[", "[]<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "(", "()<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "'", "''<Left>", { noremap = true, silent = true })
vim.keymap.set("i", '"', '""<Left>', { noremap = true, silent = true })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fn", builtin.help_tags, {})


-- fern
vim.keymap.set("n", "<leader>fo", [[:Fern . -reveal=%<CR>]], {})


-- vscode keymap
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.keymap.set("n", "<C-CR>", actions.select_vertical, { remap = true })


-- buffer move
vim.keymap.set("n", "<S-j>", [[:bp<CR>]], { noremap = true })
vim.keymap.set("n", "<S-k>", [[:bn<CR>]], { noremap = true })

-- Telescopeの選択時の動作を変更
-- vim.api.nvim_set_keymap('n', '<S-CR>', ': lua require("telescope.builtin").find_files({ layout_strategy = "vertical" })<CR>', { noremap = true})
