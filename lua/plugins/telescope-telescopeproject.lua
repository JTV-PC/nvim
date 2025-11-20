-- Telescope + UI-Select + Project integration

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-project.nvim",
		},

		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					initial_mode = "normal",

					mappings = {
						n = {
							["h"] = actions.move_selection_previous,
							["l"] = actions.move_selection_next,
							["k"] = actions.preview_scrolling_up,
							["j"] = actions.preview_scrolling_down,

							-- FIXED: manually enter insert mode
							["i"] = function()
								vim.cmd("startinsert")
							end,

							["q"] = actions.close,
						},

						i = {
							["<C-h>"] = actions.move_selection_previous,
							["<C-l>"] = actions.move_selection_next,
							["<C-k>"] = actions.preview_scrolling_up,
							["<C-j>"] = actions.preview_scrolling_down,
							["<Esc>"] = actions.close,
						},
					},
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},

					project = {
						hidden_files = true,
						theme = "dropdown",
						order_by = "recent",
						sync_with_nvim_tree = true,
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("project")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

			vim.keymap.set("n", "<leader>fp", telescope.extensions.project.project, {
				desc = "Switch project",
			})
		end,
	},
}
