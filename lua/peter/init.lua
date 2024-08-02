require 'peter.remap'
print 'hello in peter dir'

vim.opt.swapfile = false

-- python lsp server configuration
-- pylsp.plugins.rope_autoimport.enable = true
--
--
local function set_makeprg_cpp()
  vim.api.nvim_buf_set_option(0, 'makeprg', 'build.bat')
end
-- cpp file of ECB is made here
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Compile ECB file with make',

  pattern = 'cpp',
  callback = set_makeprg_cpp,
})

require 'peter.ecbcpp'
