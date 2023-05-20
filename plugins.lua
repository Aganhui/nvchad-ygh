local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Hop (Better Navigation)
  {
    "phaazon/hop.nvim",
    lazy = false,
    -- lazy = true,
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { 
        keys = 'etovxqpdygfblzhckisuran',
        quit_key = '<SPC>',
      }
    end
  },

  {
    'stevearc/aerial.nvim',
    lazy = false,
    config = function() 
      require('aerial').setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
        end
      }
    end
  },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    -- cmd = "SymbolsOutline",
    -- keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    -- config = true,
    config = function()
      require("symbols-outline").setup()
    end,
  },

  -- {
  --   'simrat39/symbols-outline.nvim',
  --   lazy = false,
  --   opts = overrides.symboloutline,
  --   -- config = function(_, opts)
  --     -- require("symbols-outline").setup(opts)
  --   -- end,
  -- },

  	-- symbols-outline
	-- https://github.com/simrat39/symbols-outline.nvim
 --  {
 --    'simrat39/symbols-outline.nvim',
 --    lazy = false,
	-- 	after = "nvim-lspconfig",
	-- 	setup = function()
	-- 		require("core.lazy_load").on_file_open "symbols-outline.nvim"
	-- 	end,
	-- 	config = function()
	-- 		local opts = {
	-- 			show_guides = false,
	-- 			auto_close = true,
	-- 			show_symbol_details = false,
	-- 		}
	-- 		require("symbols-outline").setup(opts)
	-- 	end,
	-- },

  -- {
  --   'simrat39/symbols-outline.nvim',
  --   opts = overrides.symboloutline,
  --   config = function(_, opts)
  --     require("symbols-outline").setup(opts)
  --   end,
  -- },
  -- 
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "fatih/vim-go",
    lazy = false,
    -- enabled = false,
  },
  
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    config = function()
      require("custom.configs.coc")    -- ygh: the way to import
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencie = { 
      'nvim-tree/nvim-web-devicons', 
      -- opt = true 
    },
    config = function()
      require("custom.configs.lualine")
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    -- config = function()
    --   require("copilot").setup({})
    -- end,
    config = function()
      require("custom.configs.copilot")
    end,
  },
  
  {
    'nvim-lua/plenary.nvim',
    lazy = false,
    config = function()
      require("plenary").setup()
    end,
  },
  
  {
    'nvim-pack/nvim-spectre',
    lazy = false,
    config = function()
      require("custom.configs.spectre")
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

}

return plugins
