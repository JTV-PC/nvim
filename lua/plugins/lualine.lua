-- Status bar for the editor.

return{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- or "tokyonight", "gruvbox", etc.
        section_separators = "",
        component_separators = "",
      },
    })
  end,
}

