return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
 {
 	"williamboman/mason.nvim",
 	opts = {
 		ensure_installed = {
 			"lua-language-server", "stylua", "rust-analyzer",
 			"html-lsp", "css-lsp" , "prettier"
 		},
 	},
 },

  
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          debounce = 75
          
        
        }
      })
      require("copilot.suggestion").is_visible()
      require("copilot.suggestion").toggle_auto_trigger()
    end,
  },


 {
 	"nvim-treesitter/nvim-treesitter",
 	opts = {
 		ensure_installed = {
 			"vim", "lua", "vimdoc",
      "html", "css"
 		},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
 --       disabled = {"rust"},
      },
 	},
 },
  { "rust-lang/rust.vim", ft = "rust", init = function()
      vim.g.rustfmt_autosave = 1 
    end
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
},
   {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { 'mrcjkb/rustaceanvim', version = '^4',lazy = false},
  { "nvim-lua/plenary.nvim" },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6' },
  { 'simrat39/rust-tools.nvim'}

}
