-- number options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"

-- Настройки таба
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = false

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.tabstop = 4 -- 4 пробела для табуляции
		vim.opt_local.shiftwidth = 4 -- 4 пробела для автоотступа
		vim.opt_local.expandtab = true -- Пробелы вместо табов
	end,
})

-- Настройки поиска
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Настройки интерфейса
vim.opt.termguicolors = true
vim.g.VM_highlight_matches = 'underline'
vim.opt.signcolumn = "yes"

vim.opt.clipboard = 'unnamedplus' -- buffer(copy to the system)

vim.opt.swapfile = false -- отключить свап файлы
vim.opt.backup = false -- откючить бекап файлы
vim.opt.undofile = true -- включить история изменений


-- user event that loads after UIEnter + only if file buf is there
vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_buf_get_option(args.buf, "buftype")

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end, 0)
    end
  end,
})

-- отключить стандартную подсветку
vim.opt.syntax = 'off'

