return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "lua",
      "python",
      "html",
      "css",
      "javascript",
      "gdscript",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "python",
        "html",
        "css",
        "javascript",
        "gdscript",
      },
      callback = function()
        -- Syntax highlighting
        vim.treesitter.start()

        -- Treesitter indentation
        vim.bo.indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

