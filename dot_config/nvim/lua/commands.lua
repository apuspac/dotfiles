# vscodeでそのファイルのその行を開く
vim.api.nvim_create_user_command('Opencode', function()
  local file = vim.fn.expand('%:p')
  local line = vim.fn.line('.')
  local workspace= vim.fn.getcwd()
  local cmd = string.format('code "%s" --goto "%s:%s"', workspace, file, line)
  vim.fn.system(cmd)

  -- vim.fn.system('code "' .. workspace .. '" "' .. '--goto' ..  '" "' .. file .. ':' .. line .. '"')
  -- vim.fn.system('code ' .. workspace .. file .. ':' .. line)
end, {})

