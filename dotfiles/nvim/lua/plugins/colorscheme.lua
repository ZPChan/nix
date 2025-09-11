return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
	-- Remove this once fix is out: https://github.com/LazyVim/LazyVim/pull/6354
	{
		"catppuccin",
		optional = true,
		opts = function()
			local bufferline = require("catppuccin.groups.integrations.bufferline")
			bufferline.get = bufferline.get or bufferline.get_theme
		end,
	},
}
