vim.g.mapleader = " "     -- Ledar key

vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors = true  -- true color


vim.opt.number = true   -- 番号表示
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


vim.opt.clipboard:append({unnamedeplus = true})         -- クリップボード連携
