local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then

  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",

    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")





-- set options
-- --カレントディレクトリを自動で移動
-- vim.opt.autochdir=true
-- --バッファ内で扱う文字コード(文字列)
-- vim.opt.encoding='utf-8'
-- --書き込む文字コード(文字列) : この場合encodingと同じなので省略可
-- vim.opt.fileencoding='utf-8'
-- 番号表示
vim.opt.number = true
-- -特殊文字表示
vim.opt.list = true
vim.opt.listchars = {tab='>-', trail='*', nbsp='+'}
-- -エラー時の音を画面表示に
vim.opt.visualbell = true
-- -括弧の連携
vim.opt.showmatch = true
vim.opt.matchtime = 1
-- -ヘルプファイル
vim.opt.helplang = 'ja', 'en'
-- tabバーの表示
vim.opt.showtabline = 4

-- tab文字
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 4

-- 入力時
vim.opt.smartindent = true

-- 検索
-- -大文字無視
vim.opt.ignorecase = true
-- -大文字で検索したら区別をつける
vim.opt.smartcase = true
-- -検索が末尾までいったら先頭から検索
vim.opt.wrapscan = true


-- クリップボード連携
vim.opt.clipboard:append({unnamedeplus = true})
