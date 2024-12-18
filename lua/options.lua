require "nvchad.options"

-- General Settings
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.o.cmdheight = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- Conditional Cursor Column
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*", -- Listen for all file types
    callback = function()
        local prog_langs = {
            "python", "lua", "javascript", "typescript", "java", "c", "cpp", 
            "rust", "go", "ruby", "perl", "php", "html", "css", "json", 
            "yaml", "xml", "bash", "sh", "zsh", "make", "cmake"
        }
        if vim.tbl_contains(prog_langs, vim.bo.filetype) then
            vim.opt.cursorcolumn = true
        end
    end,
})

-- Formatting on Save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        pcall(function()
            require("conform").format({ bufnr = args.buf })
        end)
    end,
})

-- Linting on Save
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        pcall(function()
            require("lint").try_lint()
        end)
    end,
})
