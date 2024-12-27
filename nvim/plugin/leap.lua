if vim.g.did_load_leap_plugin then
  return
end
vim.g.did_load_leap_plugin = true

-- Keys:
--   - use `l` to leap forward, and `h` to leap backward
--   - for a single-letter jump, press a letter, then <cr>
--   - press <cr> to repeat jump
--   - use j for [j]ump to another window
--   - from now on, f F t T , ; and k are free !
-- All the movements are possible with leap.
-- Also I have arrows and pgup,pgdn,home,end on a separate layer

vim.keymap.set({'n', 'x', 'o'}, 'l',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'h',  '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'j', '<Plug>(leap-from-window)')

vim.keymap.set({'n', 'x', 'o'}, 'f', '<Nop>')
vim.keymap.set({'n', 'x', 'o'}, 'F', '<Nop>')
vim.keymap.set({'n', 'x', 'o'}, 't', '<Nop>')
vim.keymap.set({'n', 'x', 'o'}, 'T', '<Nop>')
vim.keymap.set({'n', 'x', 'o'}, ',', '<Nop>')
vim.keymap.set({'n', 'x', 'o'}, ';', '<Nop>')
vim.keymap.set({'n', 'x', 'o'}, 'k', '<Nop>')
