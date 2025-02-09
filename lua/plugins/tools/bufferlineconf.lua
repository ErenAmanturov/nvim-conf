require("bufferline").setup({
	options = {
		numbers = "none",
		close_command = "bdelete",
		right_mouse_command = "bdelete!",
		left_mouse_command = "buffer",
		middle_mouse_command = nil,
		indicator = {
			icon = "▎",
			style = "icon",
		},
		buffer_close_icon = "  ",
		modified_icon = "[󰐕]",
		close_icon = "  ",
		left_trunc_marker = "«",
		right_trunc_marker = "»",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return icon .. count
		end,
		offsets = {
			{
				filetype = "neo-tree",
				text = function()
					-- return require("pacman").get_pacman_text()
					-- return "Neo-tree ^^"
					return ""
				end,
				text_align = "center",
				separator = true,
			},
		},
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		separator_style = "thin",
	},
})
