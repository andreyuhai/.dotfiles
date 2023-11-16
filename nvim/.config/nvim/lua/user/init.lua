require("user.packer")

require("user.autopairs")
require("user.colorscheme")
require("user.comment")
require("user.hop")
require("user.indent-blankline")
require("user.lsp")
require("user.lualine")
require("user.settings")
require("user.telescope")
require("user.treesitter")

-- Somehow if this needs to be in the end otherwise keymaps won't work for some reason
require("user.keymap")
