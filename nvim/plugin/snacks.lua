local snacks = require('snacks')

vim.keymap.set('n', '<space>ht', snacks.lazygit.open, {desc = 'lazygit'})

vim.keymap.set('n', '<Plug>(snacks-terminal-toggle)', function () snacks.terminal.toggle('fish') end)
vim.keymap.set('n', '<space>ta', '1<Plug>(snacks-terminal-toggle)', {desc = 'toggle terminal 1'})
vim.keymap.set('n', '<space>to', '2<Plug>(snacks-terminal-toggle)', {desc = 'toggle terminal 2'})
