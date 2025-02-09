require("lualine").setup({
	options = {
		icons_enabled = true, -- Включить иконки
		theme = "auto", -- Тема
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			winbar = { "dashboard" }, -- Если используется winbar, исключаем и его
			statusline = { "dashboard" }, -- Убираем dashboard из статусной линии
		},
		ignore_focus = { "neo-tree", "dashboard" }, -- Игнорируем фокус в neo-tree
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true, -- Включаем общую статус-линию
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = {
			function()
				if vim.fn.exists("b:VM_Selection") == 1 and not vim.tbl_isempty(vim.b.VM_Selection) then
					local status = vim.fn["VMInfos"]().status:lower() -- Преобразуем статус в нижний регистр
					local replacements = {
						["active"] = "󱢓 MCursor:",
					}
					return replacements[status] or status -- Заменяем, если статус найден в таблице
				else
					return ""
				end
			end,
			function()
				local mode_map = {
					n = " Normal",
					i = " Insert",
					v = "󰈈 Visual",
					V = "󰈈 V-Line",
					[""] = "󰈈 V-Block",
					c = " Command",
					t = " Terminal",
					r = "󰑕 Replace",
					R = "󰑕 Replace",
				}
				return mode_map[vim.fn.mode()] or "Unknown"
			end,
		},
		lualine_b = {
			{ "branch", icon = "" },
			{ "diff", icon = "" },
			{ "diagnostics", icon = "" },
		},
		lualine_c = {
			"filename",
		},
		lualine_x = {
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
