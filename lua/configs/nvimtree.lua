local nvimtree = require("nvim-tree")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1

nvimtree.setup({
    view = {
        width = 35,
        relativenumber = true,
    },
    renderer = {
        -- indent_markers = {
        --   enable = true,
        -- },
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "", -- arrow when folder is open
                },
            },
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        custom = { ".ds_store" },
    },
    git = {
        ignore = true,
    },
})
