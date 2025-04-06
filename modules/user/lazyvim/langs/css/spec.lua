return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				cssls = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				css = { "prettierd" },
			},
		},
	},
}
