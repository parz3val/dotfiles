require("nvim-tree").setup({
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	sort_by = "case_sensitive",
	view = {
		width = 20,
	},
	renderer = {
		group_empty = true,
	},
	-- filters = {
	-- 	dotfiles = true,
	-- },
	update_focused_file = {
		update_root = true,

	}
})
