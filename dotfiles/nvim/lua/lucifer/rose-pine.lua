local rosepine = require("rose-pine")

rosepine.setup({
	variant="main",
	dim_inactive_windows = false,
	extend_background_behiund_borders = true,
	enable = {
		terminal = true,
		legacy_highlights = true,
		migratations = true,
	},
	styles = {
		bold = true,
		italic = true,
		transparency = true,
	},
})

vim.cmd.colorscheme("rose-pine")
