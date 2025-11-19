return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				python = { "flake8" },
				javascript = { "eslint" },
				lua = { "luacheck" },
				-- add more filetypes as needed
			}

			-- optional: lint on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "black" },
					javascript = { "prettier" },
					lua = { "stylua" },
					-- add more filetypes here
				},
				-- autoformat on save
				format_on_save = true,
			})
		end,
	},
}
