if vim.g.did_load_typescript_tools_plugin then
  return
end
vim.g.did_load_typescript_tools_plugin = true

require('typescript-tools').setup({})
