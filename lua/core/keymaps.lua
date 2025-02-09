-- requirements
-- local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

---------------------------------------------------

-- KEYMAPS
vim.g.mapleader = " " -- leader key

kmap("n", "<C-n>", "<cmd>Neotree toggle<CR>", {
		noremap = true,
		silent = true,
		desc = "    Toggle Neotree"
})


-- CUSTOM KEYMAPS
kmap('n', "<C-d>", "<C-d>zz")
kmap('n', "<C-u>", "<C-u>zz")

-- PYRIGHT CONFIG FILE CREATION
kmap("n", "<leader>p", "<cmd>lua require('core.scripts.config_file')()<CR>", { desc = 'Pyright config' })

-- TAB
kmap('n', '<tab>', "<cmd>BufferLineCycleNext<CR>", opts)
kmap('n', '<S-tab>', "<cmd>BufferLineCyclePrev<CR>", opts)
kmap('n', '<leader>x', "<cmd>bdelete<CR>", opts)
