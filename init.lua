
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
-- LSP 
require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig')

-- treesitter
require("nvim-treesitter").setup({})


-- This autocommand enables treesitter, which includes syntax highlighting.
-- Because there are a number of language types not supported. we check against
-- those and do not enable treesitter in those cases.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        local unsupported_types= {"oil", "lazy_backdrop", 'lazy', "cmp_menu", "text"}
        local filetype_supported = true
        local ft = vim.bo.filetype
        for _, val in pairs(unsupported_types) do
            if (ft==val) then
               filetype_supported = false
            end
        end
        if (filetype_supported) then
            vim.treesitter.start()
        end
    end,
})


-- This configures the diagnostic messages that nvim provides. It does 3
-- important things. 
--  1. disables virtual text which is required for the tiny-inline-diagnostic
--  2. disables diagnostic signs that bump out the line numbers in an annoying way
--  3. Colors the line numbers instead of leaving a warning message
vim.diagnostic.config({
    virtual_text=false, -- False required for diagnostic plugin
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.INFO]  = '',
            [vim.diagnostic.severity.HINT]  = ''
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN]  = 'WarningMsg',
            [vim.diagnostic.severity.INFO]  = 'DiagnosticInfo',
            [vim.diagnostic.severity.HINT]  = 'DiagnosticHint'
        }
    }
})


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
vim.o.ignorecase = true     -- case insensitive searching
vim.o.smartcase = true      -- ignore case when searching with lowercase letters

