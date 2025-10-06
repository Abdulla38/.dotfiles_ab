-- Lsp

return {
	"neovim/nvim-lspconfig",
	opts = {},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.enable("luals")
		vim.lsp.enable("pyrgiht")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.config("luals", {
			cmd = { "lua-language-server" },
			capabilities = capabilities,
			filetypes = { "lua" },
			settings = {
				Lua = {
					workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
					telemetry = { enable = false },
				},
				diagnostics = {
					globals = { "vim" },
				},
			},
		})
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}
