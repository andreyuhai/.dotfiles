return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      local telescope = require("telescope")
      local builtin   = require("telescope.builtin")

      telescope.load_extension("live_grep_args")

      vim.keymap.set("n", "<Leader>ff", function ()
	builtin.find_files()
      end)

      vim.keymap.set("n", "<Leader>gf", function ()
	builtin.git_files()
      end)

      vim.keymap.set("n", "<Leader>fw", function()
	builtin.grep_string { search = vim.fn.expand("<cword>") }
      end)

      vim.keymap.set("n", "<Leader>fb", function()
	builtin.buffers()
      end)

      vim.keymap.set("n", "<Leader>fg", function()
	builtin.grep_string({ search = vim.fn.input("Grep For > ") })
      end)

      vim.keymap.set("n", "<Leader>fl", function()
	telescope.extensions.live_grep_args.live_grep_args()
      end)
    end
  }
}
