local vim = vim

-- auto complete
-- vim.keymap.set("i", "{", "{}<Left>", { noremap = true, silent = true })
-- vim.keymap.set("i", "[", "[]<Left>", { noremap = true, silent = true })
-- vim.keymap.set("i", "(", "()<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "'", "''<Left>", { noremap = true, silent = true })
vim.keymap.set("i", '"', '""<Left>', { noremap = true, silent = true })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fn", builtin.help_tags, {})

vim.keymap.set("n", "<C-p>", builtin.find_files, {}) -- vscode

-- fern
vim.keymap.set("n", "<leader>fo", [[:Fern . -reveal=% <CR>]], {})

-- comment
vim.keymap.set("n", "<C-_>", "gcc", { noremap = true, silent = true })
-- vim.keymap.set("v", "<C-/>", "gc", { noremap = true, silent = true })


-- buffer move
-- vim.keymap.set("n", "<S-j>", [[:bp<CR>]], { noremap = true })
-- vim.keymap.set("n", "<S-k>", [[:bn<CR>]], { noremap = true })



-- coc.nvim
-- goto code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { noremap = true, silent = true })
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = true })

-- navigate diagnostics
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { noremap = true, silent = true })
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { noremap = true, silent = true })

-- document symboles
-- vim.keymap.set("n", "K", "[[:call ]]"




-- NOTE: coc-copilot で comflict 起こしてるっぽい？ので、 コメントアウトしている。
-- あまり困っていない。
-- local function check_backspace()
--   local col = vim.fn.col(".") - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
-- end
--
-- local function pum_visible()
--   return vim.fn.pumvisible() == 1
-- end
--
-- vim.keymap.set("i", "<TAB>", [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_backspace() ? <TAB> : coc#refresh()]], {silent = true, expr = true, noremap = true })
-- vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : <C-h>]], { silent = true, expr = true, noremap = true })
--
-- _G.check_backspace = check_backspace
-- _G.pum_visible = pum_visible

