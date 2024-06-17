vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)


local lazy_config = {}

local plugins = {
  -- plugins are here 
    {  
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
   },
      {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
          require "configs.conform"
        end,
      },
     {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      config = {
        center = {
          {
            icon = '',
            icon_hl = 'group',
            desc = 'description',
            desc_hl = 'group',
            key = 'shortcut key in dashboard buffer not keymap !!',
            key_hl = 'group',
            key_format = ' [%s]', -- `%s` will be substituted with value of `key`
            action = '',
          },
        },
        footer = {},
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

  
      -- These are some examples, uncomment them if you want to see them work!
      -- {
      --   "neovim/nvim-lspconfig",
      --   config = function()
      --     require("nvchad.configs.lspconfig").defaults()
      --     require "configs.lspconfig"
      --   end,
      -- },
      --
      -- {
      -- 	"williamboman/mason.nvim",
      -- 	opts = {
      -- 		ensure_installed = {
      -- 			"lua-language-server", "stylua",
      -- 			"html-lsp", "css-lsp" , "prettier"
      -- 		},
      -- 	},
      -- },
      --
      -- {
      -- 	"nvim-treesitter/nvim-treesitter",
      -- 	opts = {
      -- 		ensure_installed = {
      -- 			"vim", "lua", "vimdoc",
      --      "html", "css"
      -- 		},
      -- 	},
      -- },
}

require("lazy").setup({
  plugins,
  lazy_config
})

require("configs.lspconfig")
require("configs.conform")




-- load theme
dofile(vim.g.base46_cache .. "defaults") 
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"



vim.schedule(function()
  require "mappings"
end)
