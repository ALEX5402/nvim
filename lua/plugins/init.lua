local lazy = require("lazy")
return {
	{
		"mfussenegger/nvim-jdtls",
	},
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		confg = function()
			require("configs.neocord")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		lazy = "VeryLazy",
		config = function()
			require("configs.lint")
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = "VeryLazy",
		cmd = "ToggleTerm",
		config = function()
			require("configs.toggleterm")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server", -- Lua language server
				"stylua", -- Lua formatter
				"kotlin-language-server", -- Kotlin language server
				"jdtls", -- Java language server
				"rust-analyzer", -- Rust language server
				"clangd", -- C++ language server
				"ccls", -- C language server
				"pyright", -- Python language server
				"taplo", -- TOML language server
				"bash-language-server", -- Bash language server
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = "VeryLazy",
		requires = { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"java",
				"kotlin",
				"rust",
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = "VeryLazy",
		event = "BufRead",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("configs.dapui")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = "VeryLazy",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
		config = function()
			require("configs.mason_dap")
		end,
	},
	{
		"folke/noice.nvim",
		enabled = true,
		lazy = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		event = { "BufRead", "BufnewFile", "BufReadPre" },
		opts = {
			messages = {
				enabled = false,
			},
			notify = {
				enabled = true,
			},
			lsp = {
				progress = {
					enabled = true,
				},
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
			},
		},
	},

	{ "echasnovski/mini.icons", version = false },
	{
		"echasnovski/mini.animate",
		lazy = "VeryLazy",
		event = "BufRead",
		config = function()
			require("mini.animate").setup()
		end,
	},
	{
		"yamatsum/nvim-cursorline",
		lazy = true,
		event = { "BufRead", "BufnewFile" },
		config = function()
			require("configs.cursorline")
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		enabled = true,
		event = "VimEnter",
		config = function()
			require("configs.dashboard")
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"folke/which-key.nvim",
		lazy = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			dofile(vim.g.base46_cache .. "whichkey")
			require("configs.whichkey")
		end,
	},
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		enabled = true,
		lazy = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		lazy = "VeryLazy",
		event = { "BufRead", "BufnewFile", "InsertEnter" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.lualine")
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("configs.webdevicons")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.nvimtree")
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"nvim-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"seandewar/killersheep.nvim",
		lazy = "VeryLazy",
		config = function()
			require("configs.killersheep")
		end,
	},
	{
		"mrjones2014/smart-splits.nvim",
		event = "BufRead",
		lazy = "VeryLazy",
		config = function()
			require("configs.smart-split")
		end,
	},
}
