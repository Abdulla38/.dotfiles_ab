-- Colorscheme

return {
	"rebelot/kanagawa.nvim",
	opts = {
		theme = "kanagawa", -- change here
	},
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		local ok, _ = pcall(vim.cmd.colorscheme, opts.theme)
		if not ok then
			vim.notify("Theme '" .. opts.theme .. "' not found!", vim.log.levels.ERROR)
		end
	end,
}
