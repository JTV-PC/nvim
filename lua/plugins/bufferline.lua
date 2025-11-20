return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- use buffers for the tabline
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				diagnostics = "nvim_lsp",
				separator_style = "slant", -- "slant" | "thick" | "thin" | "padded_slant"
				show_tab_indicators = true,
				always_show_bufferline = true,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		})

		-- 🔥 Keymaps for buffer switching
		vim.keymap.set("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
		vim.keymap.set("n", "<leader>bc", "<Cmd>bdelete<CR>", { desc = "Close buffer" })
	end,
}
