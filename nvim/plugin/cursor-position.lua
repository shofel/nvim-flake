if vim.g.did_load_cursor_position then
  return
end

local function getPosition ()
  local data = vim.fn.getcursorcharpos()
  return table.concat(data, ", ", 2, 3)
end

local function showCursorPosition ()
  local pos = getPosition()

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, {pos})

  local win = vim.api.nvim_open_win(buf, false, {
    relative = 'cursor', width = pos:len(), height = 1,
    col = 0, row = 1, anchor = 'NW', style = 'minimal',
  })

  local ns = vim.api.nvim_create_namespace('curpos-float-choe3IeV')

  vim.on_key(function ()
    vim.on_key(nil, ns)
    vim.api.nvim_win_close(win, true)
    vim.api.nvim_buf_delete(buf, {force = true})
  end, ns)
end

local key = '<space><c-g>'

if not vim.fn.hasmapto(key) then
  vim.keymap.set('n', key,  showCursorPosition, {desc = "show cursor position"})
end
