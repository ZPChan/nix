return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				jsonls = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				json = { "prettierd" },
				jsonc = { "prettierd" },
			},
		},
	},
}
