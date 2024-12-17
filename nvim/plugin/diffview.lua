if vim.g.did_load_diffview_plugin then
  return
end
vim.g.did_load_diffview_plugin = true

vim.keymap.set('n', '<space>gfb', function()
  vim.cmd.DiffviewFileHistory(vim.api.nvim_buf_get_name(0))
end, { desc = 'diffview [g]it [f]ile history (current [b]uffer)' })
vim.keymap.set('n', '<space>gfc', vim.cmd.DiffviewFileHistory, { desc = 'diffview [g]it [f]ile history ([c]wd)' })
vim.keymap.set('n', '<space>gd', vim.cmd.DiffviewOpen, { desc = '[g]it [d]iffview open' })
vim.keymap.set('n', '<space>gft', vim.cmd.DiffviewToggleFiles, { desc = '[g]it [d]iffview [f]iles [t]oggle' })
