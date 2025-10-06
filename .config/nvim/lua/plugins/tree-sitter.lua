-- True colors

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "python", "toml", "lua", "vimdoc", "rust", "markdown", "markdown_inline", "json" },
			sync_install = true,

			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
	build = ":TSUpdate",
}
