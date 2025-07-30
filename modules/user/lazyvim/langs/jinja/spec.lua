return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				jinja_lsp = {
					filetypes = { "jinja" },
				},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				jinja = { "djlint" },
			},
		},
	},
}
