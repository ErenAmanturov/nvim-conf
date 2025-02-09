local function default_header()
	return {
		"",
		"",
		"███████╗██████╗ ███████╗███╗   ██╗██╗   ██╗██╗███╗   ███╗",
		"██╔════╝██╔══██╗██╔════╝████╗  ██║██║   ██║██║████╗ ████║",
		"█████╗  ██████╔╝█████╗  ██╔██╗ ██║██║   ██║██║██╔████╔██║",
		"██╔══╝  ██╔══██╗██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
		"███████╗██║  ██║███████╗██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
		"╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
		"",
	}
end

require("dashboard").setup({
	theme = "doom",
	config = {
		header = default_header(),
		center = {
			{
				icon = "    ",
				icon_hl = "Title",
				desc = "Git Branches",
				desc_hl = "String",
				key = "b",
				key_hl = "Number",
				action = function()
					if vim.fn.isdirectory(".git") == 1 then
						require("telescope.builtin").git_branches()
					else
						vim.notify("No Git repository found.", vim.log.levels.WARN, {
							title = "Git",
							icon = "󰊢",
						})
					end
				end,
			},
			{
				icon = "    ",
				icon_hl = "Title",
				desc = "Recent files",
				desc_hl = "String",
				key = "r",
				key_hl = "Number",
				action = function()
					local action_state = require("telescope.actions.state")
					local telescope = require("telescope.builtin")

					telescope.oldfiles({
						attach_mappings = function(prompt_bufnr, map)
							local function open_and_change_dir()
								local selection = action_state.get_selected_entry()
								if not selection then
									print("[Telescope] No selection")
									return
								end
								-- Извлекаем путь к выбранному файлу
								local filepath = selection.path or selection.filename
								if filepath then
									-- Меняем рабочую директорию
									local dir = vim.fn.fnamemodify(filepath, ":h")
									vim.cmd("cd " .. dir)
									-- Принудительно открываем файл
									vim.cmd("e! " .. filepath)
								end
							end

							-- Привязываем действие к Enter
							map("i", "<CR>", open_and_change_dir)
							map("n", "<CR>", open_and_change_dir)
							return true
						end,
					})
				end,
			},
			{
				icon = "    ",
				icon_hl = "Title",
				desc = "Open Neovim Config",
				desc_hl = "String",
				key = "o",
				key_hl = "Number",
				action = ":cd ~/.config/nvim | edit init.lua",
			},
			-- Quit Button [q]
			{
        icon = '󰩈    ',
				desc = "Quit [q]", -- Centered text
				desc_hl = "String",
				key = "q",
				key_hl = "Number",
				action = ":qa", -- Quit Neovim command
			},
		},
	},
})
