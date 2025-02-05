local function getPosition ()
  local data = vim.fn.getcursorcharpos()
  return table.concat(data, ", ", 2, 3)
end

local function showCursorPosition ()
  local pos = getPosition()

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, {pos})

  vim.api.nvim_open_win(buf, false, {
    relative = 'cursor', width = pos:len(), height = 1,
    col = 0, row = 1, anchor = 'NW', style = 'minimal',
  })

  -- close window on any key
  local ns
  ns = vim.on_key(function ()
    vim.on_key(nil, ns)
    vim.api.nvim_buf_delete(buf, {force = true})
  end)
end

-- expose key to map
vim.keymap.set('n', '<Plug>(cursor-position-show)', showCursorPosition, { desc = 'show cursor position'})

-- map default key

local key = '<space><c-g>'

if vim.fn.mapcheck(key) == '' then
  vim.keymap.set('n', key,  showCursorPosition, { desc = "show cursor position" })
end
