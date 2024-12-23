vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

-- @see https://github.com/nvim-neorg/neorg/wiki/Default-Keybinds#normal-mode-1

vim.keymap.set('n', '<Return>cm',
  '<Plug>(neorg.looking-glass.magnify-code-block)',
  {desc = 'code magnify'})
vim.keymap.set('n', '<Return>id',
  '<Plug>(neorg.tempus.insert-date)',
  {desc = 'insert date'})

-- List
vim.keymap.set('n', '<Return>li',
  '<Plug>(neorg.pivot.list.invert)',
  {desc = 'list invert'})
vim.keymap.set('n', '<Return>lt',
  '<Plug>(neorg.pivot.list.toggle)',
  {desc = 'list toggle'})

-- Tasks
vim.keymap.set('n', '<Return>ta',
  '<Plug>(neorg.qol.todo-items.todo.task-ambiguous)',
  {desc = 'mark task as ambiguous'})
vim.keymap.set('n', '<Return>tc',
  '<Plug>(neorg.qol.todo-items.todo.task-cancelled)',
  {desc = 'mark task as cancelled'})
vim.keymap.set('n', '<Return>td',
  '<Plug>(neorg.qol.todo-items.todo.task-done)',
  {desc = 'mark task as done'})
vim.keymap.set('n', '<Return>th',
  '<Plug>(neorg.qol.todo-items.todo.task-on-hold)',
  {desc = 'mark task as on hold'})
vim.keymap.set('n', '<Return>ti',
  '<Plug>(neorg.qol.todo-items.todo.task-important)',
  {desc = 'mark task as important'})
vim.keymap.set('n', '<Return>tp',
  '<Plug>(neorg.qol.todo-items.todo.task-pending)',
  {desc = 'mark task as pending'})
vim.keymap.set('n', '<Return>tr',
  '<Plug>(neorg.qol.todo-items.todo.task-recurring)',
  {desc = 'mark task as recurring'})
vim.keymap.set('n', '<Return>tu',
  '<Plug>(neorg.qol.todo-items.todo.task-undone)',
  {desc = 'mark task as undone'})
