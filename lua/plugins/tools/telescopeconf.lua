local builtin = require('telescope.builtin')

-- Main keybindings
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find all files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find all buffers" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Grep text" })
vim.keymap.set("n", "<leader>ft", builtin.help_tags, { desc = "Help tags" })


vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "All commands" })

local function check_git_and_run(callback)
	if vim.fn.isdirectory(".git") == 1 then
		callback()
	else
		vim.notify("No Git repository found", vim.log.levels.WARN, {
			title = "Git",
			icon = "󰊢",
		})
	end
end

-- GIT
vim.keymap.set('n', '<leader>gb', function ()
  check_git_and_run(builtin.git_branches)
end, { desc = 'Git branches' })

vim.keymap.set('n', '<leader>gc', function ()
  check_git_and_run(builtin.git_commits)
end, { desc = 'Git commits' })

vim.keymap.set('n', '<leader>gs', function ()
  check_git_and_run(builtin.git_status)
end, { desc = 'Git status' })
