-- --カレントディレクトリを自動で移動
-- vim.opt.autochdir=true
-- --バッファ内で扱う文字コード(文字列)
vim.opt.encoding='utf-8'
-- --書き込む文字コード(文字列) : この場合encodingと同じなので省略可
vim.opt.fileencoding='utf-8'
-- --読み込む文字コード(文字列のリスト) : この場合UTF-8を試し、だめならShift_JIS
-- vim.opt.fileencodings=utf-8,cp932
-- --eコマンド等でTabキーを押すとパスを保管する(文字列のリスト) : この場合まず最長一致文字列まで補完し、2回目以降は一つづつ試す
-- vim.opt.wildmode=longest,full


-- vim.opt.syntax=enable
-- vim.opt.colorscheme=slate



-- 表示
-- -番号表示
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
-- -tabバーの表示
vim.opt.showtabline = 2


-- 入力時
vim.opt.smartindent = true
-- -タブ文字
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- 検索
-- -大文字無視
vim.opt.ignorecase = true
-- -大文字で検索したら区別をつける
vim.opt.smartcase = true
-- -検索が末尾までいったら先頭から検索
vim.opt.wrapscan = true

-- カーソル移動
-- - 行を跨いでの移動
-- vim.opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'
-- - 削除時の対象
-- vim.opt.backspace = 'start', 'eol', 'indent'

-- ファイル環境
-- -フォーマット
-- vim.opt.fileformats = 'dos', 'unix', 'mac'

-- クリップボード連携
vim.opt.clipboard:append({unnamedeplus = true})

-- マウス有効
-- vim.opt.mouse = 'a'
