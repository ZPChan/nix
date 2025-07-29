return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				jinja_lsp = {
					filetypes = { "jinja", "html", "htm" },
				},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				jinja = { "djlint" },
				html = { "djlint" },
				htm = { "djlint" },
			},
		},
	},
}
