
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
   "lua_ls", -- Lua
   "jdtls", -- Java
   "kotlin_language_server", -- Kotlin
   "rust_analyzer", -- Rust
   "clangd", -- C++
   "pyright", -- Python
   "taplo", -- TOML
}

-- Setup LSPs with default config
for _, lsp in ipairs(servers) do
   if lsp == "clangd" then
      lspconfig.clangd.setup({
         on_attach = on_attach,
         on_init = on_init,
         capabilities = capabilities,
         cmd = { "/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/clangd" },
         filetypes = { "c", "cpp", "objc", "objcpp" },
         root_dir = lspconfig.util.root_pattern("Android.mk", "CMakeLists.txt", ".git"),
         init_options = {
            clangdFileStatus = true,
            arguments = {
               "-isystem", "/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include", -- NDK headers
               "-isystem", "/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/x86_64-linux-android", -- Android platform headers
               -- Add other paths if needed
            },
         },
      })
   elseif lsp == "rust_analyzer" then
      lspconfig.rust_analyzer.setup({
         on_attach = on_attach,
         on_init = on_init,
         capabilities = capabilities,
         settings = {
            ["rust-analyzer"] = {
               checkOnSave = {
                  command = "clippy",
               },
            },
         },
      })
   else
      lspconfig[lsp].setup({
         on_attach = on_attach,
         on_init = on_init,
         capabilities = capabilities,
      })
   end
end

-- Explicit setup for jdtls (Java) and kotlin_language_server
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

