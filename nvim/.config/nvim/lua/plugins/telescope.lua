return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    init = function()
      local telescope = require("telescope")
      local builtin   = require("telescope.builtin")

      telescope.load_extension("live_grep_args")

      vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<Leader>fl", telescope.extensions.live_grep_args.live_grep_args, {})
      vim.keymap.set("n", "<Leader>fo", builtin.oldfiles, {})
      vim.keymap.set("n", "<Leader>gf", builtin.git_files, {})

      vim.keymap.set("n", "<Leader>fg", function() builtin.grep_string({ search = vim.fn.input("Grep For > ") }) end, {})
      vim.keymap.set("n", "<Leader>fw", function() builtin.grep_string { search = vim.fn.expand("<cword>") } end, {})
    end,
    opts = function ()

      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      return {
	extensions = {
	  live_grep_args = {
	    auto_quoting = true,
	    mappings = {
	      i = {
		["<C-k>"] = lga_actions.quote_prompt(),
		["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob "}),
		["<C-t>"] = lga_actions.quote_prompt({ postfix = " -g "}),
		-- freeze the current list and start a fuzzy search in the frozen list
		["<C-r>"] = actions.to_fuzzy_refine,
	      }
	    }
	  }
	}
      }
    end
  }
}
