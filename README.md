# Neovim Configuration

This repository contains my custom Neovim configuration, tailored for efficient development in various programming languages, with support for several language servers and enhanced user experience through carefully selected plugins.

## Features

- **Language Server Protocol (LSP) Support** for multiple languages (C/C++, Rust, Python, Kotlin, Java, Lua, TOML).
- **Code formatting** with `conform.nvim`.
- **Linting** with `nvim-lint`.
- **Autocompletion** powered by `coc.nvim` and `TabNine`.
- **Enhanced file navigation** using `nvim-tree` and `telescope.nvim`.
- **Integrated debugging** via `nvim-dap`.
- **Terminal integration** with `toggleterm.nvim`.
- **Rich UI** improvements, including status lines, icons, animations, and dashboards.

---

## Plugins

Here is a list of all the plugins used in this configuration:

1. **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)**
   - Provides code formatting functionality, auto-formats code on save using LSP.

2. **[neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)**
   - Intellisense engine for Neovim with support for autocompletion, code navigation, and more.

3. **[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**
   - Easy configuration of LSP servers with custom settings for each language.

4. **[codota/tabnine-nvim](https://github.com/codota/tabnine-nvim)**
   - AI-powered autocompletion for faster coding.

5. **[mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)**
   - Linting on save for supported languages.

6. **[akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**
   - Terminal management inside Neovim.

7. **[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)**
   - Install and manage LSP servers, formatters, and linters.

8. **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**
   - Syntax highlighting and code navigation based on Treesitter.

9. **[rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)**
   - A UI for debugging with `nvim-dap`.

10. **[folke/noice.nvim](https://github.com/folke/noice.nvim)**
    - Enhanced UI notifications and input handling.

11. **[echasnovski/mini.icons](https://github.com/echasnovski/mini.icons)**
    - Provides a set of icons for a clean UI.

12. **[echasnovski/mini.animate](https://github.com/echasnovski/mini.animate)**
    - Adds smooth animations to Neovim UI elements.

13. **[yamatsum/nvim-cursorline](https://github.com/yamatsum/nvim-cursorline)**
    - Highlights the line under the cursor.

14. **[nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)**
    - Customizable dashboard that greets you upon starting Neovim.

15. **[folke/which-key.nvim](https://github.com/folke/which-key.nvim)**
    - Displays key bindings as you type them.

16. **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**
    - Fuzzy finder for files, grep, and more.

17. **[nvim-telescope/telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)**
    - Extends Telescope with argument support for live grep.

18. **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**
    - A blazing-fast status line for Neovim.

19. **[kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)**
    - File icons for Neovim.

20. **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**
    - A file explorer tree for Neovim.

21. **[echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope)**
    - Visualizes the current scope of indentation.

22. **[mrjones2014/smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)**
    - Smart and dynamic window splitting for Neovim.

---

## Language Server Configuration

The following language servers are configured:

1. **Clangd (C/C++)**:
   - Custom `clangd` from the Android NDK is used with additional options for Android development:
     - `clangd` is located in `/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/clangd`.
     - Includes Android NDK headers.
     - System headers are excluded using `-nostdinc`.

2. **Lua Language Server (`lua_ls`)**:
   - Provides support for Lua, particularly useful for Neovim configuration.

3. **JDTLS (Java)**:
   - Java development tools.

4. **Kotlin Language Server**:
   - Supports Kotlin development.

5. **Rust Analyzer**:
   - Configured to run Clippy on save for Rust projects.

6. **Pyright (Python)**:
   - Fast Python LSP for development.

7. **Taplo (TOML)**:
   - Adds support for TOML files.

---

## Autocommands

- **Format on Save**: 
  - Automatically formats code using `conform.nvim` on `BufWritePre`.

- **Lint on Save**:
  - Runs linters via `nvim-lint` after saving a file with `BufWritePost`.

---

## Installation

To use this configuration, make sure you have [Neovim](https://neovim.io/) 0.8+ installed.

1. Clone this repository to your Neovim configuration folder:
   ```sh
   git clone https://github.com/username/nvim-config ~/.config/nvim
   ```

2. Install the required plugins by launching Neovim and running:
   ```sh
   :Lazy
   ```

3. Configure Mason to install the LSP servers:
   ```sh
   :MasonInstall lua-language-server jdtls kotlin_language_server rust-analyzer clangd pyright taplo
   ```

---

## Contribution

Feel free to fork this repository and customize it to your needs. Any suggestions or improvements are welcome!

---

Enjoy coding with Neovim! 😊

---
