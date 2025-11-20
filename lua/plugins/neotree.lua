return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		},
	},
	config = function()
		-- Toggle
		vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>", {})

		-- Change directory interactively
		vim.keymap.set("n", "<leader>nd", function()
			vim.ui.input({ prompt = "New directory: " }, function(dir)
				if dir and dir ~= "" then
					require("neo-tree.command").execute({
						action = "focus",
						source = "filesystem",
						position = "left",
						dir = dir,
					})
				end
			end)
		end, { desc = "Neo-tree: Change directory" })

		-- Change root to current file folder
		vim.keymap.set("n", "<leader>nr", function()
			local file_dir = vim.fn.expand("%:p:h")
			require("neo-tree.command").execute({
				action = "focus",
				dir = file_dir,
			})
		end, { desc = "Neo-tree: Root to current file" })
	end,
}
