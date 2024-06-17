-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "lua_ls", "jdtls", "kotlin_language_server" , "rust_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })

  lspconfig.jdtls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "lua_ls", "jdtls", "kotlin_language_server", "rust_analyzer" } -- Note: use "rust_analyzer" for Rust


-- Setup LSPs with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    -- Special settings for rust_analyzer
    settings = lsp == "rust_analyzer" and {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    } or nil,
  })
end

  lspconfig.kotlin_language_server.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end
