
-- Leader Keymapping  for all plugins
vim.g.mapleader = " "

----------
-- Plugins
----------
-- Found in lua/
require("keymaps") 	    -- Personal Keymappings

-- Found in lua/config/
require("config.lazy")  -- Plugin Manager.

--NOTE: Plugins will not work if pasted above the plugin manager in this file

-- Found in lua/plugins
require("lualine").setup({}) 	-- Statusline
require("mini.pairs").setup()   -- Automatically close brackets and quotes
require("nvim-tree").setup()    -- File tree for navigation
require("oil").setup()          -- Folder Navigation
require('tiny-inline-diagnostic').setup({	-- Better diagnostic messages
    preset = "powerline",
    throttle = 20,
    -- enable_on_insert = true
})

vim.diagnostic.config({virtual_text=false}) -- False required for above plugin

-- LSP 
require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig')

require("lazydev").setup() -- Adds Vim API to lua language server

--------------------
-- Vim Configuration
--------------------
-- vim.cmd.colorscheme("tokyonight") -- Colorscheme
vim.cmd.colorscheme("rose-pine-moon") -- Colorscheme

vim.opt.nu = true           -- Numbered Lines
vim.opt.wrap = false        -- No Text Wrapping
vim.o.expandtab = true	    -- Neovim always uses spaces instead of tabs
vim.o.tabstop = 4           -- Set Tabstops every 4 spaces
vim.o.softtabstop = 4       -- Config backspace to jump to the prev. tabstop 
vim.o.shiftwidth = 4 	    -- Set the shift width to 4
vim.o.textwidth = 80 	    -- Text width for formatting text into paragraphs (using gw)
vim.o.smartindent = true    -- Smart Indent
vim.o.smartcase = true      -- ignore case when searching with lowercase letters

