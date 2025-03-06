return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				marksman = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				md = { "prettierd" },
				markdown = { "prettierd" },
			},
		},
	},
}
