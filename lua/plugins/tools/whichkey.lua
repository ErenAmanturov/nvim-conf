local whichkey = require('which-key')

whichkey.add({

  { "<leader>l", group = 'LSP' },
  { "<leader>ld", desc = ' LSP definition' },
  { "<leader>lD", desc = ' LSP declaration' },
  { "<leader>lk", desc = ' LSP Hover' },
  { "<leader>lr", desc = ' LSP References' },

  { "<leader>g", group = 'GIT' },
  { "<leader>gg", desc = 'LazyGit' },
  { "<leader>gb", desc = 'Git branches' },
  { "<leader>gc", desc = 'Git commits' },
  { "<leader>gs", desc = 'Git status' },

}, { prefix = '<leader>' })
