require('telescope').load_extension('lazygit')
vim.api.nvim_set_keymap('n', "<leader>gg", '<cmd>LazyGit<cr>', { desc = "LazyGit" })
