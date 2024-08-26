local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
    "lua_ls",               -- Lua
    "jdtls",                -- Java
    "kotlin_language_server", -- Kotlin
    "rust_analyzer",        -- Rust
    "clangd",               -- C++
    "ccls",                 -- C
    "pyright",              -- Python
    "taplo",                -- TOML
    "bashls"                -- Bash
}

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

-- Explicit setup for jdtls and kotlin_language_server
lspconfig.jdtls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.kotlin_language_server.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})
