return {
  cmd = { "prettier", "--stdin-filepath", "$FILENAME" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "html", "json", "yaml", "markdown" },
  root_markers = { ".prettierrc", ".prettierrc.json", ".prettierrc.js", "package.json", ".git" }
}
