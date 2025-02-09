local cmp = require("cmp")
local lspkind = require('lspkind')
local cmp_ui = {
  icons = true,
  lspkind_text = true,
  style = 'default',
  border_color = 'grey_fg',
  selected_item_bg = 'colored',
}

local cmp_style = cmp_ui.style

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end



cmp.setup({
  completion = {
    completeopt = "menu,menuone",
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- Show both symbol and text
			maxwidth = 50, -- Max width of text in the menu
			ellipsis_char = "...", -- Add ellipsis if text is too long
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				path = "[Path]",
			},
		}),
	},
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
	window = {
		-- UI settings for the autocomplete menu
		completion = {
			border = "rounded", -- Rounded borders
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
			col_offset = 4, -- Offset to prevent overlapping with the cursor
		},
		-- UI settings for the documentation popup
    documentation = {
      border = "rounded", -- Rounded borders
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
    },
	},

  }
)
