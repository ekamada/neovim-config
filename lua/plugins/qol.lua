
-- This file will contain all of the 'Quality of Life' plugins that are not
-- stricly related to writing code, provide a meaningful improvement to the user
-- experience

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
    },


    {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "nvim-mini/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
      -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
      lazy = false,
    },

    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate',
      config = function ()
        require("nvim-treesitter").install({"svelte", "typescript", "html", "css", "scss", "diff", "gitcommit"})
      end,
      highlight = { enable = true }, -- replaces vim syntax highlighting
      indent = { enable = true }     -- replaces vim indentation
    }
}


