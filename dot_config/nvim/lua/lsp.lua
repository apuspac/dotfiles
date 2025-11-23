-- LSPサーバーの設定を登録
vim.lsp.config('rubocop', require('lsp.rubocop'))
vim.lsp.config('ruby_lsp', require('lsp.ruby_lsp'))
vim.lsp.config('gopls', require('lsp.gopls'))
vim.lsp.config('copilot-language-server', require('lsp.copilot-language-server'))
vim.lsp.config('eslint-lsp', require('lsp.eslint-lsp'))
vim.lsp.config('intelephense', require('lsp.intelephense'))
vim.lsp.config('phpactor', require('lsp.phpactor'))
vim.lsp.config('prettier', require('lsp.prettier'))
vim.lsp.config('typescript-language-server', require('lsp.typescript-language-server'))

-- LSPサーバーを有効化
vim.lsp.enable('rubocop')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('gopls')
vim.lsp.enable('copilot-language-server')
vim.lsp.enable('eslint-lsp')
vim.lsp.enable('intelephense')
vim.lsp.enable('phpactor')
vim.lsp.enable('prettier')
vim.lsp.enable('typescript-language-server')

