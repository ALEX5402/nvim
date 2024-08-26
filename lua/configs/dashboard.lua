local banners = require "banners"

local function rand_banner()
    local keys = {}
    for key, _ in pairs(banners) do
        table.insert(keys, key)
    end

    local randomKey = keys[math.random(#keys)]
    return banners[randomKey]
end

local header = {
    banner = rand_banner(),
    title = "  Welcome to Neovim",
    details = {
        { icon = " ", desc = vim.fn.system "git branch --show-current" },
        { icon = " ", desc = vim.fn.strftime "%a %b %d %I:%M %p" },
    },
}

local opts = {
    theme = "doom",
    config = {
        header = header.banner,
        center = {
            { icon = " ", desc = vim.fn.strftime "%a %b %d %I:%M %p" },
            {
                icon = " ",
                desc = "Find File",
                action = function()
                    require("telescope.builtin").find_files()
                end,
                key = "f",
            },
            { icon = " ", desc = "New File", action = "ene | startinsert", key = "n" },
            {
                icon = "󱄽 ",
                desc = "Find Word",
                action = function()
                    require("telescope.builtin").live_grep()
                end,
                key = "g",
            },
            {
                icon = " ",
                desc = "Recent Files",
                action = function()
                    require("telescope.builtin").oldfiles()
                end,
                key = "r",
            },
            { icon = "󰙅 ", desc = "File Browser", action = "NvimTreeToggle", key = "e" },
            { icon = "󰊳 ", desc = "Open Lazy", action = "Lazy", key = "l" },
            { icon = "󰺾 ", desc = "Open Mason", action = "Mason", key = "m" },
            {
                icon = "󰋗 ",
                desc = "Search Help",
                action = function()
                    require("telescope.builtin").help_tags()
                end,
                key = "h",
            },
            {
                icon = " ",
                desc = "Open Config",
                action = function()
                    require("telescope.builtin").find_files { cwd = "~/.config/nvim/" }
                end,
                key = "c",
            },
            { icon = "󰩈 ", desc = "Quit", action = "qa", key = "q" },
        },
    },
}



for _, action in ipairs(opts.config.center) do
    action.desc = action.desc .. string.rep(" ", 43 - #action.desc)
    action.icon_hl = "Title"
    action.desc_hl = "String"
    action.key_hl = "Number"
end

-- close Lazy and re-open when the dashboard is ready
if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
            require("lazy").show()
        end,
    })
end

require("dashboard").setup(opts)
