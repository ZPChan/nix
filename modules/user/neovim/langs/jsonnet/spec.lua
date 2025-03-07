return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				jsonnet_ls = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				jsonnet = { "jsonnetfmt" },
			},
		},
	},
}
