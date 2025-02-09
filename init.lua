-- core
require("core.options")
require("core.lazy.config")
require("core.keymaps")

-- scripts
require('core.scripts.config_file')

--themes
require("core.colorscheme")

--tools
require("plugins.tools.neo")
require("plugins.tools.telescopeconf")
require("plugins.tools.gitsigns")
require("plugins.tools.scope")
require("plugins.tools.dashboard")
require("plugins.tools.blankline")
require("plugins.tools.comment")
require("plugins.tools.lualine")
require("plugins.tools.tree-sitter")
require("plugins.tools.lazygitconf")
require("plugins.tools.bufferlineconf")

-- cmp tools
require("plugins.tools.cmp")
require("plugins.tools.lspkin")

-- lsp
require('plugins.lsp.config')

