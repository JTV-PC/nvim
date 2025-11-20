return {
	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			-- Keymaps
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git hunk" })
			vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
			vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" })
			vim.keymap.set("n", "<leader>gN", ":Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
		end,
	},

	-- Diffview
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({})
		end,
	},

	-- Neogit
	{
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true, -- Enables diffview integration
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open Neogit" })
			vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
			vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Close Diffview" })
		end,
	},
}
