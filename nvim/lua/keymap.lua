-- telescope
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fn", builtin.help_tags, {})


-- vscode keymap
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.keymap.set("n", "<S-CR>", actions.select_vertical, { remap = true })


-- Telescopeの選択時の動作を変更
-- vim.api.nvim_set_keymap('n', '<S-CR>', ':lua require("telescope.builtin").find_files({ layout_strategy = "vertical" })<CR>', { noremap = true})
