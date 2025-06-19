return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      border = "double",
      dimensions = { height = 0.9, width = 0.9 },
    })

    -- Example keybindings
    vim.keymap.set('n', '<A-a>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<A-a>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
