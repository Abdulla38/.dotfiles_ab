-- Debugger
return {
	"mfussenegger/nvim-dap",
	opts = {},
	-- Debugger for C
	config = function()
		local dap = require("dap")
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}
	end,
}
