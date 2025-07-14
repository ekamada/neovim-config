
vim.keymap.set('n',';',':')
vim.keymap.set('i', 'df', '<esc>')       -- Quick Escape
vim.keymap.set('n','<tab>', ":bn<cr>") 	 -- Forwards to next buffer
vim.keymap.set('n','<S-tab>', ":bN<cr>") -- Backwards to previous buffer
vim.keymap.set('n','<leader>t',':NvimTreeToggle<CR>') -- Toggle Nvim-Tree

-- Toggle Diagnostics
vim.keymap.set('n', '<leader>dd', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })


