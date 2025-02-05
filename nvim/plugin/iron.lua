local iron = require('iron')

vim.keymap.set('n', '<space>r', '<nop>', {desc = 'repl'})

iron.core.setup({
   keymaps = {
    send_motion              = "<space>ra",
    visual_send              = "<space>r",
    send_file                = "<space>rf",
    send_line                = "<space>rl",
    send_until_cursor        = "<space>ru",
    send_mark                = "<space>rm",
    send_code_block          = "<space>rb",
    send_code_block_and_move = "<space>rB",
    mark_motion              = "<space>rM",
    mark_visual              = "<space>rM",
    remove_mark              = "<space>rMc",
    cr                       = "<space>r<cr>",
    interrupt                = "<space>r<space>",
    exit                     = "<space>rq",
    clear                    = "<space>rl",
  },
})

vim.keymap.set('n', '<space>R',  '<cmd>IronReplHere<cr>')
vim.keymap.set('n', '<space>rr', iron.core.send_line)
