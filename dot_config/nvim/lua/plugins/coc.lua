return {
    "neoclide/coc.nvim",
    enabled = false,
    config = function()
        vim.g.coc_global_extensions = {
            --basic
            'coc-json',
            'coc-git',
            'coc-sumneko-lua',
            'coc-docker',

            'coc-clangd',
            'coc-copilot',
            'coc-tsserver',

        }

        local vim = vim
       
        vim.opt.backup = false  -- backup issueがあるらしい
        vim.opt.writebackup = false

        vim.opt.updatetime = 300  -- デフォルトは4秒で 反応が遅いため

        vim.opt.signcolumn = "yes"  -- diagnostics が表示非表示したときに textがずれてしまうため

        --auto complete
        function _G.check_back_space()
            local col = vim.fn.col('.') - 1
            return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        -- tabを押すと補間が選択されるようになる
        -- defualt だと tab で補完が選択される。無効にするときは、 suggest.noselect: true に。
        local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
        vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
        vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

        -- <CR>で補完を適用する
        vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

        -- trigger snippets
        vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
        -- trigger completion
        vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

        -- goto code navigation
        vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { noremap = true, silent = true })
        vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { noremap = true, silent = true })
        vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { noremap = true, silent = true })
        vim.keymap.set("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = true })

        -- navigate diagnostics
        vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { noremap = true, silent = true })
        vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { noremap = true, silent = true })

        -- document symboles
        -- preview window に表示
        function _G.show_docs()
            local cw = vim.fn.expand('<cword>')
            if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
                vim.api.nvim_command('h ' .. cw)
            elseif vim.api.nvim_eval('coc#rpc#ready()') then
                vim.fn.CocActionAsync('doHover')
            else
                vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
            end

        end
        vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


        -- cursor が holdされたときに、ハイライトさせる
        vim.api.nvim_create_augroup("CocGroup", {})
        vim.api.nvim_create_autocmd("CursorHold", {
            group = "CocGroup",
            command = "silent call CocActionAsync('highlight')",
            desc = "Highlight symbol under cursor on CursorHold"
        })

        -- Symbol renaming
        vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

        -- Formatting selected code
        -- = でのフォーマットと 何か違うのかしら？
        vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
        vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

        -- setup formatexpr 指定されたファイルタイプに従ってformatexprを設定
        vim.api.nvim_create_autocmd("FileType", {
            group = "CocGroup",
            pattern = "typescript,json",
            command = "setl formatexpr=CocAction('formatSelected')",
            desc = "Setup formatexpr specified filetype(s)."
        })

        -- placeholder(スニペットが挿入されたときに、引数にフォーカスしてくれるやつ)で、別の引数にjumpしたときに、
        -- helpも一緒に更新してくれるようにするやつ。
        vim.api.nvim_create_autocmd("User", {
            group = "CocGroup",
            pattern = "CocJumpPlaceholder",
            command = "call CocActionAsync('showSignatureHelp')",
            desc = "Update signature help on jump placeholder"
        })

        -- code action 適用のためのkeymap
        -- Apply codeAction to the selected region
        -- Example: `<leader>aap` for current paragraph
        local opts = {silent = true, nowait = true}
        vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
        vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

        -- Remap keys for apply code actions at the cursor position.
        vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)

        -- Remap keys for apply source code actions for current file.
        vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)

        -- quickfixの適用
        -- Apply the most preferred quickfix action on the current line.
        vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

        -- Remap keys for apply refactor code actions.
        vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
        vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
        vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

        -- Run the Code Lens actions on the current line
        vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


        -- Map function and class text objects
        -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
        vim.keymap.set("x", "if", "<Plug>(coc-funcobj-i)", opts)
        vim.keymap.set("o", "if", "<Plug>(coc-funcobj-i)", opts)
        vim.keymap.set("x", "af", "<Plug>(coc-funcobj-a)", opts)
        vim.keymap.set("o", "af", "<Plug>(coc-funcobj-a)", opts)
        vim.keymap.set("x", "ic", "<Plug>(coc-classobj-i)", opts)
        vim.keymap.set("o", "ic", "<Plug>(coc-classobj-i)", opts)

        vim.keymap.set("x", "ac", "<Plug>(coc-classobj-a)", opts)
        vim.keymap.set("o", "ac", "<Plug>(coc-classobj-a)", opts)

        --- C-d, C-u 派なので、こっちはpopupのスクロールになりそう
        --- これ、<C-w-w>で、そのwindowの中に移動できるので、それでスクロールする。
        --- なので、いらないかも?
        -- Remap <C-f> and <C-b> to scroll float windows/popups
        ---@diagnostic disable-next-line: redefined-local
        local opts = {silent = true, nowait = true, expr = true}
        vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
        vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
        vim.keymap.set("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
        vim.keymap.set("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
        vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
        vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

        -- Use CTRL-S for selections ranges
        -- Requires 'textDocument/selectionRange' support of language server
        vim.keymap.set("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
        vim.keymap.set("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})

        -- Add `:Format` command to format current buffer
        vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

        -- " Add `:Fold` command to fold current buffer
        -- buffer を折りたたむ
        vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

        -- Add `:OR` command for organize imports of the current buffer
        --
        vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

        -- ステータスラインにcocの情報を表示できるように
        -- Add (Neo)Vim's native statusline support
        -- NOTE: Please see `:h coc-status` for integrations with external plugins that
        -- provide custom statusline: lightline.vim, vim-airline
        vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

        -- Mappings for CoCList
        -- code actions and coc stuff
        ---@diagnostic disable-next-line: redefined-local
        local opts = {silent = true, nowait = true}
        -- Show all diagnostics

        vim.keymap.set("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
        -- Manage extensions
        vim.keymap.set("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
        -- Show commands
        -- vim.keymap.set("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
        -- Find symbol of current document
        vim.keymap.set("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
        -- Search workspace symbols
        vim.keymap.set("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)

        -- Do default action for next item
        vim.keymap.set("n", "<space>j", ":<C-u>CocNext<cr>", opts)
        -- Do default action for previous item
        vim.keymap.set("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
        -- Resume latest coc list
        vim.keymap.set("n", "<space>p", ":<C-u>CocListResume<cr>", opts)


        vim.keymap.set('i', '<C-l>', '<Plug>(coc-snippets-expand)', { noremap = true, silent = true })

        -- Use <C-j> for select text for visual placeholder of snippet.
        vim.keymap.set('v', '<C-j>', '<Plug>(coc-snippets-select)', { noremap = true, silent = true })

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

