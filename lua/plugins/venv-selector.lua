return {
  "linux-cultist/venv-selector.nvim",
  config = function()
    require("venv-selector").setup{
      name = "venv",  -- environment variable name (optional)
      search_venv_managers = true,  -- automatically detect venvs
      auto_refresh = true,
    }
								vim.keymap.set("n", "<leader>vv", ":VenvSelect<CR>", { noremap = true, silent = true })
  end
}

