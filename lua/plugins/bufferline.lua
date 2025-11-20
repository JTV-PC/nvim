return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- show buffers, not tabs
				style_preset = require("bufferline").style_preset.default,
				numbers = "none",

				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,

				separator_style = "slant",
				show_buffer_close_icons = true,
				show_close_icon = false,
				always_show_bufferline = true,

				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		-- Keymaps
		local map = vim.keymap.set

		-- Pick a buffer
		map("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick Buffer" })
		-- Pick a buffer to close
		map("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick Close Buffer" })

		-- Move between buffers
		map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
		map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })

		-- Close current buffer
		map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })
	end,
}
