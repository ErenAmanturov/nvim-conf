local keymap = vim.keymap.set

local on_attach = function(client, bufrn)
	local opts = { noremap = true, silent = true, buffer = bufrn }

	keymap("n", "<leader>lD", vim.lsp.buf.declaration, opts)
	keymap("n", "<leader>ld", vim.lsp.buf.definition, opts)
	keymap("n", "<leader>lk", vim.lsp.buf.hover, opts)
	keymap("n", "<leader>lr", vim.lsp.buf.references, opts)
end

require("lspconfig").pyright.setup({
  on_attach = on_attach,
})
