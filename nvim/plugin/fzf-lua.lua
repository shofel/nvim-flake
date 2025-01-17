if vim.g.did_load_fzf_plugin then
  return
end
vim.g.did_load_fzf_plugin = true

local fzf = require('fzf-lua')
local keymap = vim.keymap

fzf.setup({'max-perf'})

keymap.set('n', '<space>/', fzf.blines,            {desc = 'blines'})
keymap.set('n', '<space>fc', fzf.command_history,  {desc = 'command history'})
keymap.set('n', '<space>fg', fzf.live_grep_native, {desc = 'live grep native'})
keymap.set('n', '<space>fh', fzf.helptags,         {desc = 'helptags'})
keymap.set('n', '<space>fi', fzf.git_files,        {desc = 'git files'})
keymap.set('n', '<space>fl', fzf.files,            {desc = 'files'})
keymap.set('n', '<space>fk', fzf.keymaps,          {desc = 'keymaps'})
keymap.set('n', '<space>fm', fzf.resume,           {desc = 'resume'})
keymap.set('n', '<space>fn', fzf.builtin,          {desc = 'builtin'})
keymap.set('n', '<space>fr', fzf.git_branches,     {desc = 'git branches'})
keymap.set('n', '<space>fs', fzf.git_status,       {desc = 'git status'})
keymap.set('n', '<space>ft', fzf.tabs,             {desc = 'tabs'})
keymap.set('n', '<space>fu', fzf.buffers,          {desc = 'buffers'})

keymap.set('v', '<space>f', fzf.grep_visual, {desc = 'grep visual'})
