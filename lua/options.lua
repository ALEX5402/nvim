require "nvchad.options"

vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.o.cmdheight = 0
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
-- vim.opt.guicursor = "n:block-blinkwait1000-blinkon500-blinkoff500"
vim.opt.termguicolors = true
