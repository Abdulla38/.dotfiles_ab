-- Autocomplete

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		-- Snippets
		"L3MON4D3/LuaSnip",
	},
	version = "1.*",

	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			nerd_font_variant = "normal",
		},
		completion = { documentation = { auto_show = true } },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "lua" },
	},
	opts_extend = { "sources.default" },
}
