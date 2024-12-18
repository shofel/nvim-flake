if vim.g.did_load_statuscol_plugin then
  return
end
vim.g.did_load_statuscol_plugin = true

-- @see https://github.com/luukvbaal/statuscol.nvim

vim.opt.number = false
vim.opt.relativenumber = false

local builtin = require("statuscol.builtin")

require('statuscol').setup {
  setopt = true,
  relculright = true,
  segments = {
    { text = { '%s' }, click = 'v:lua.ScSa', },
    { text = { builtin.foldfunc }, click = "v:lua.ScFa", sign = {auto = true}, },
  },
}
