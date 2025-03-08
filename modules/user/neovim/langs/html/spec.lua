return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				html = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				html = { "prettierd" },
				htm = { "prettierd" },
			},
		},
	},
}
