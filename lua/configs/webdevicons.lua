return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").set_icon({
			gql = {
				icon = "",
				color = "#e535ab",
				cterm_color = "199",
				name = "GraphQL",
			},
			override_by_filename = {
				[".ecrc"] = {
					icon = "",
					name = "EditorConfigChecker",
					color = C.green,
				},
				[".envrc"] = {
					icon = "",
					name = "envrc",
					color = C.yellow,
				},
				[".editorconfig"] = {
					icon = "",
					name = "EditorConfig",
					color = C.green,
				},
				[".luacheckrc"] = {
					icon = "󰢱",
					name = "LuacheckRC",
					color = C.blue,
				},
			},
		})
	end,
}
