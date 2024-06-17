local tabnine = require("tabnine")

tabnine.setup({
  disable_auto_comment = false,
  accept_keymap = false,
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = "~/tablinelogs.txt",
  tabnine_enterprise_host = "https://tabnine.customer.com"
})
