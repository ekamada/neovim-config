
-- The plugins included in this file will serve to improve the experience of
-- writing code

return {
    {   -- auto-brackets, auto-quotes
        'echasnovski/mini.pairs', 
        version = '*',
    },

-- The plugins below serve to facilitate the installation and management of
-- language servers, which provide meaningful features to the experience
-- 
-- According to Perplexity:
--     Language servers are important because they provide a standardized and efficient
--     way to deliver advanced language-specific features—such as code completion,
--     go-to-definition, error highlighting, inline documentation, and refactoring
--     support
--
-- Mason is a plugin that manages 'external editor tooling' such as LSPs. It is
-- recommended to include additional plugins as mason only makes packages
-- available for use. Something needs to take advantage of the plugins that
-- it installs.
-- 
-- According to Perplexity
--      nvim-lspconfig and mason.nvim work together to streamline the
--      installation, configuration, and management of language servers in
--      Neovim, but they serve distinct roles and require an intermediary
--      plugin—mason-lspconfig.nvim—for optimal integration.``

    {   -- LSP Plugins
        "williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
    },

    { -- Config Lua Language server for neovim config
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {   -- Auto-complete Plugins
        'hrsh7th/nvim-cmp',     -- Using nvim-cmp because i already got it working
                                -- on desktop
		event = "InsertEnter",  -- Load when entering Insert Mode
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		opts = function()
		    local cmp = require('cmp')
			local luasnip= require('luasnip')
			return {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},

				-- Set Keymappings to navigate autocomplete window
				mapping = cmp.mapping.preset.insert {
    				['<C-d>'] = cmp.mapping.scroll_docs(-4),
    				['<C-f>'] = cmp.mapping.scroll_docs(4),
    				['<C-Space>'] = cmp.mapping.complete {},
    				['<CR>'] = cmp.mapping.confirm {
    				  behavior = cmp.ConfirmBehavior.Replace,
    				  select = true,
    				},

					-- Tab through to next autocomplete suggestion
    				['<Tab>'] = cmp.mapping(function(fallback)
    				  if cmp.visible() then
    				    cmp.select_next_item()
    				  elseif luasnip.expand_or_jumpable() then
    				    luasnip.expand_or_jump()
    				  else
    				    fallback()
    				  end
    				end, { 'i', 's' }),

					-- Tab back to previous autocomplete suggestion
    				['<S-Tab>'] = cmp.mapping(function(fallback)
    				  if cmp.visible() then
    				    cmp.select_prev_item()
    				  elseif luasnip.jumpable(-1) then
    				    luasnip.jump(-1)
    				  else
    				    fallback()
    				  end
    				end, { 'i', 's' }),
				},
				sources = {
					{name = 'nvim_lsp'},
					{name = 'luasnip'},
				}
			}
		end

    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()

            --vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
        end
    }
}
