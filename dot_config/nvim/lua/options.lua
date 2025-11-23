local vim = vim
vim.g.mapleader = " "     -- Ledar key


------- options
vim.opt.encoding = 'utf-8'

vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors = true  -- true color

vim.opt.laststatus = 3          -- ステータスバーを常に表示

vim.opt.number = true   -- 番号表示
-- vim.opt.relativenumber = true

-- 特殊文字表示
vim.opt.list = true
vim.opt.listchars = {tab='>-', trail='*', nbsp='+'}

vim.opt.visualbell = true       -- エラー時の音を画面表示に

--括弧の連携
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.helplang = 'ja', 'en'   -- -ヘルプファイル
vim.opt.showtabline = 4         -- tabバーの表示
-- tab文字
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 4

-- 入力時
vim.opt.smartindent = true

-- 検索
vim.opt.ignorecase = true       -- 大文字無視
vim.opt.smartcase = true        -- 大文字で検索したら区別をつける
vim.opt.wrapscan = true         -- 検索が末尾までいったら先頭から検索


-- vim.opt.clipboard:append({unnamedplus = true})         -- クリップボード連携

-- vim.opt.hidden = true           -- 非表示バッファを閉じるときに保存する
vim.opt.makeprg='cd build && make'



-- telescope 勝手にinsertモードになる問題
-- https://github.com/nvim-telescope/telescope.nvim/issues/2027
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})


vim.api.nvim_create_autocmd(
    {
        "BufRead", -- ファイル読み込む
        "BufNewFile", -- new file作成の時。
    },
    {
        pattern = "*.vert,*.frag,*.comp,*.geom,*.tesc,*.tese", -- このパターンの時適用
        callback = function() -- ここの関数が実行される
            vim.bo.filetype = "glsl"
        end,
    }
)

-- LSP Inlay Hints
-- LSPがアタッチされた時に自動的にInlay Hintsを有効化
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})

