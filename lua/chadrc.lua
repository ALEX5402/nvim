-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local options = {

	-- nvchad theme is now migrated to base46 so here it is
	base46 = {
	  theme = "catppuccin", -- default theme
	  hl_add = {},
	  hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	  },
	  integrations = {},
	  changed_themes = {},
	  transparency = true,
	  theme_toggle = { "onedark", "catppuccin" },
	},
	--  nv ui element 
	ui = {
	  cmp = {
		icons = true, -- only for non-atom styles!
		style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
		lspkind_text = true,
		source = true,
		border = "single",
	  },
  
	telescope = { style = "bordered" }, -- borderless / bordered
	-- used nvchad default statusline icons because it looks better 
    tabufline = {
        enabled = true,
        lazyload = true,
        order = { "treeOffset", "buffers", "tabs", "btns" },
        modules = nil,
    },

  },

  --- finally  nvdash part goes here
  nvdash = {
	load_on_startup = true,
  
	-- Header Section
	header = {
	  [[         /\_/\           ]],
	  [[    ____/ o o \          ]],
	  [[  /~____  =ø= /          ]],
	  [[ (______)__m_m)          ]],
	  [[                         ]],
	  [[   I Love Cats Meow 😽   ]],
	},
  
	-- Button Section
	buttons = {
	  -- Essential actions
	  { txt = "   Find File", keys = "ff", cmd = "Telescope find_files", hl = "String" },
	  { txt = "  略 Recent Files", keys = "fo", cmd = "Telescope oldfiles", hl = "Keyword" },
	  { txt = "󰈭   Find Word", keys = "fw", cmd = "Telescope live_grep", hl = "Function" },
	  { txt = "󱥚  🎨 Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()", hl = "Identifier" },
	  { txt = "   Key Mappings", keys = "ch", cmd = "NvCheatsheet", hl = "Constant" },
  
	  -- Custom separator
	  { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  
	  -- Plugin information
	  {
		txt = function()
		  local stats = require("lazy").stats()
		  local ms = math.floor(stats.startuptime) .. " ms"
		  return "  ⚡ Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
		end,
		hl = "NvDashFooter",
		no_gap = true,
	  },
  
	  -- System Info (New Feature)
	  {
		txt = function()
		  local uptime = vim.fn.system("uptime -p | tr -d '\n'")
		  return "󰑓   System Uptime: " .. uptime
		end,
		hl = "Type",
		no_gap = true,
	  },
  
	  -- Custom separator
	  { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  
	  -- Personalized Greeting (Dynamic)
	  {
		txt = function()
		  local hour = tonumber(os.date("%H"))
		  local greeting = "🌞 Good Morning!"
		  if hour >= 12 and hour < 18 then
			greeting = "🌤 Good Afternoon!"
		  elseif hour >= 18 then
			greeting = "🌙 Good Evening!"
		  end
		  return "󱉻  " .. greeting .. " Alex!"
		end,
		hl = "Title",
		no_gap = true,
	  },
	},
  
	-- Footer Section with a Dynamic Quote
	footer = {
	  txt = function()
		local quotes = {
		  "“Time spent with cats is never wasted.” – Sigmund Freud",
		  "“Cats are connoisseurs of comfort.” – James Herriot",
		  "“In a cat’s eyes, all things belong to cats.” – Anonymous",
		  "“Cats choose us; we don’t own them.” – Kristin Cast",
		  "“Meow means woof in cat.” – George Carlin",
		}
		local random_quote = quotes[math.random(#quotes)]
		return "  " .. random_quote
	  end,
	  hl = "Comment",
	},
  },
  
  
	cheatsheet = {
	  theme = "grid", -- simple/grid
	  excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},
  
	mason = { pkgs = {}, skip = {} },
  }

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
  