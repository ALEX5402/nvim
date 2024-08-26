require("mason").setup()
require("mason-nvim-dap").setup {
    automatic_setup = true,
    handlers = {
        function(config)
            require("mason-nvim-dap").default_setup(config)
        end,
    },
}
