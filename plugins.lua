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

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  
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
  
  -- funcs outline
  -- {
  --   'stevearc/aerial.nvim',
  --   lazy = false,
  --   config = function() 
  --     require('aerial').setup {
  --       -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  --       on_attach = function(bufnr)
  --         -- Jump forwards/backwards with '{' and '}'
  --         vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
  --         vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  --       end
  --     }
  --   end
  -- },
  
  -- symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    -- cmd = "SymbolsOutline",
    -- keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    -- config = true,
    config = function()
      require("custom.configs.symbols-outline")
    end,
  },
  
  -- buttom line
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
  
  -- for spectre (search and replace)
  {
    'nvim-lua/plenary.nvim',
    lazy = false,
    -- config = function()
    --   require("plenary").setup()
    -- end,
  },
  {
    'nvim-pack/nvim-spectre',
    lazy = false,
    config = function()
      require("custom.configs.spectre")
    end,
  },
}

return plugins
