if vim.g.did_load_guessindent_plugin then
  return
end
vim.g.did_load_guessindent_plugin = true

require('guess-indent').setup()
