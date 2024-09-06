vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

require("notify").setup({
  background_colour = "#000000FF"
})

require'lspconfig'.clangd.setup{
  cmd = { "/home/alex/.local/share/nvim/mason/bin/clangd" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = require'lspconfig'.util.root_pattern('compile_commands.json', '.git')
}

require("tabnine").setup({
	disable_auto_comment = true,
	accept_keymap = "<Tab>",
	dismiss_keymap = "<C-]>",
	debounce_ms = 800,
	suggestion_color = { gui = "#808080", cterm = 244 },
	exclude_filetypes = { "TelescopePrompt", "NvimTree" },
	log_file_path = nil, -- absolute path to Tabnine log file
	ignore_certificate_errors = false,
})


vim.schedule(function()
  require "mappings"
end)
