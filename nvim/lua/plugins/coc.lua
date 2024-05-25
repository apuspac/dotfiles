return {
    "neoclide/coc.nvim",
    config = function()
        vim.g.coc_global_extensions = {
            --basic
            'coc-json',
            'coc-git',
            'coc-sumneko-lua',
            'coc-docker',

            'coc-clangd',
            'coc-copilot',

        }

        local vim = vim
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

    end
}

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

