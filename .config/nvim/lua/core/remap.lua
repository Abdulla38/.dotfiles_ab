local builtin = require("telescope.builtin")
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file faster" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Telescope
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to preevious tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Explorer
keymap.set("n", "<leader>ee", ":Neotree<CR>", { desc = "Toogle file explorer" })
keymap.set("n", "<leader>ec", ":Neotree close<CR>", { desc = "Close explorer" })

-- LSP mappings
keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { desc = "Show diagnostic in float" })
keymap.set("n", "<leader>[d", function()
	vim.diagnostic.jump({ forward = true })
end, { desc = "Move to the next diagnostic" })
keymap.set("n", "<leader>]d", function()
	vim.diagnostic.jump({ forward = false })
end, { desc = "Move to the preevious diagnostic" })
keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { desc = "Add buffer diagnostics the location list" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		keymap.set("n", "K", vim.lsp.buf.hover, opts)
		keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		-- keymap
		--     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
		-- keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
		--                opts)
		-- keymap.set('n', '<Leader>sl', function()
		--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		-- keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
		keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
		keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
		-- keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		keymap.set("n", "<Leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
