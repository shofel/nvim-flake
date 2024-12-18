if vim.g.did_load_leap_plugin then
  return
end
vim.g.did_load_leap_plugin = true

vim.keymap.set({'n', 'x', 'o'}, 'l',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'h',  '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-from-window)')
