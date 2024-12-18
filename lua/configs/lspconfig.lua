-- load defaults i.e lua_lsp
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local servers = {
   "lua_ls", -- Lua
   "jdtls", -- Java
   "kotlin_language_server", -- Kotlin
   "rust_analyzer", -- Rust
   "clangd",
   "pyright", -- Python
   "taplo", -- TOML
}
lspconfig.clangd.setup({
         on_attach = on_attach,
         on_init = on_init,
         capabilities = capabilities,
         cmd = {   '/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/clangd',
    '--background-index',
    '--clang-tidy',
    '--log=verbose'},
         filetypes = { "c", "cpp", "objc", "objcpp" },
         root_dir = lspconfig.util.root_pattern("Android.mk", "CMakeLists.txt", ".git"),
         init_options = {
            clangdFileStatus = true,
            fallback_flags = { '-std=c++17' },
            arguments = {
               -- Exclude system headers
               "-nostdinc",  -- Disables including system headers from `/usr/include`
               -- Add NDK include paths
               "-isystem", "/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include",
               "-isystem", "/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/x86_64-linux-android", --
               "-I", "/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include",  -- Example project include
            },
         },
})

-- Setup LSPs with default config
for _, lsp in ipairs(servers) do
   if lsp == "rust_analyzer" then
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